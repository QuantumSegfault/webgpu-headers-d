import std.stdio;
import std.string;
import bindbc.sdl;
import core.time;
import core.thread : Thread;

import webgpu.webgpu;
import webgpu.wgpu;
import webgpu.common;

Adapter.Uniq requestAdapterSync(scope Instance.Handle instance, scope const ref RequestAdapterOptions options) @safe
{
    import core.lifetime;

    Adapter.Uniq result;
    bool invoked = false;

    RequestAdapterCallback adapterCb;
    adapterCb.mode = CallbackMode.waitAnyOnly;
    adapterCb.setDelegate((status, adapter, message) {
        assert(!invoked);

        if (status == RequestAdapterStatus.success) {
            result = move(adapter);
        }
        invoked = true;
    });

    Future future = requestAdapter(instance, options, adapterCb);

    // FIXME: wgpu does not respect WebGPU's future/callback system
    /+
    WaitStatus status;
    FutureWaitInfo[1] waitInfos = [
        FutureWaitInfo(future)
    ];
    do {
        status = waitAny(instance, waitInfos, -1);
        assert(status != WaitStatus.error);
    }
    while (status.timedOut);

    if (status == WaitStatus.success) {
        assert(invoked && waitInfos[0].completed);
    } else {
        assert(!invoked && !waitInfos[0].completed);
    }
    +/
    assert(invoked);

    return move(result);
}

Device.Uniq requestDeviceSync(scope Adapter.Handle adapter, scope Instance.Handle instance, scope const ref DeviceDescriptor descriptor) @safe
{
    import core.lifetime;

    Device.Uniq result;
    bool invoked = false;

    RequestDeviceCallback deviceCb;
    deviceCb.mode = CallbackMode.waitAnyOnly;
    deviceCb.setDelegate((status, device, message) {
        assert(!invoked);

        if (status == RequestDeviceStatus.success) {
            result = move(device);
        }
        invoked = true;
    });

    Future future = requestDevice(adapter, descriptor, deviceCb);

    // FIXME: wgpu does not respect WebGPU's future/callback system
    /+
    WaitStatus status;
    FutureWaitInfo[1] waitInfos = [
        FutureWaitInfo(future)
    ];
    do {
        status = waitAny(instance, waitInfos, 0);
        assert(status != WaitStatus.error);
    }
    while (status.timedOut);

    if (status == WaitStatus.success) {
        assert(invoked && waitInfos[0].completed);
    } else {
        assert(!invoked && !waitInfos[0].completed);
    }
    +/
    assert(invoked);

    return move(result);
}

extern (C) void wgpuLog(LogLevel level, StringView message, void* userdata)
{
    import std.string : fromStringz;

    const(char)[] str;
    if (message.length == STRLEN) {
        str = message.ptr.fromStringz;
    } else {
        str = message.ptr[0 .. message.length];
    }
    writefln!"[%s] %s"(level, str);
}

int main()
{
    if (!SDL_Init(SDL_INIT_VIDEO)) {
        writefln!"Failed to initialize SDL: %s"(SDL_GetError());
        return 1;
    }
    scope (exit)
        SDL_Quit();

    auto window = SDL_CreateWindow("WebGPU Example", 800, 600, SDL_WINDOW_RESIZABLE | SDL_WINDOW_METAL);

    if (!window) {
        writefln("Failed to create window: %s", SDL_GetError());
        return 1;
    }
    scope (exit)
        SDL_DestroyWindow(window);

    setLogLevel(LogLevel.trace);
    setLogCallback(&wgpuLog, null);

    InstanceDescriptor instanceDesc;
    auto instance = createInstance(instanceDesc).asRef;

    if (!instance) {
        writeln("Failed to create WebGPU instance.");
        return 1;
    }

    Surface.Uniq surface;
    {
        auto mtlView = SDL_Metal_CreateView(window);
        auto mtlLayer = SDL_Metal_GetLayer(mtlView);

        SurfaceSourceMetalLayer surfaceSource = {layer: mtlLayer};
        SurfaceDescriptor surfaceDesc = {nextInChain: surfaceSource};

        surface = instance.createSurface(surfaceDesc);
    };

    RequestAdapterOptions adapterOptions;
    adapterOptions.compatibleSurface = surface;
    auto adapter = instance.requestAdapterSync(adapterOptions);

    if (!adapter) {
        writeln("Failed to create WebGPU adapter.");
        return 1;
    }

    DeviceDescriptor deviceDesc;
    auto device = adapter.requestDeviceSync(instance, deviceDesc);
    if (!device) {
        writeln("Failed to create WebGPU device.");
        return 1;
    }

    auto queue = device.getQueue();
    if (!queue) {
        writeln("Failed to get device queue.");
        return 1;
    }

    ShaderSourceWGSL wgslSource = {code: q{
        struct Vertex {
            @builtin(position) pos: vec4f,
            @location(0) color: vec3f
        }

        const pos = array<vec2f, 3>(
            vec2f(0.0, 0.5),
            vec2f(-0.5, -0.5),
            vec2f(0.5, -0.5)
        );

        const color = array<vec3f, 3>(
            vec3f(1.0, 0.0, 0.0),
            vec3f(0.0, 1.0, 0.0),
            vec3f(0.0, 0.0, 1.0)
        );

        @vertex
        fn vs_main(@builtin(vertex_index) idx: u32) -> Vertex {
            return Vertex(vec4f(pos[idx], 0.0, 1.0), color[idx]);
        }

        @fragment
        fn fs_main(vertex: Vertex) -> @location(0) vec4f {
            return vec4f(vertex.color, 1.0);
        }
    }.asStringView};

    ShaderModuleDescriptor shaderDesc = {nextInChain: wgslSource};
    auto shaderModule = device.createShaderModule(shaderDesc);
    if (!shaderModule) {
        writeln("Failed to get create shader module.");
        return 1;
    }

    PipelineLayoutDescriptor layoutDesc;
    auto pipelineLayout = device.createPipelineLayout(layoutDesc);
    if (!pipelineLayout) {
        writeln("Failed to get create pipeline layout.");
        return 1;
    }

    SurfaceCapabilities surfaceCapabilities;
    surface.getCapabilities(adapter, surfaceCapabilities);

    // TODO: bind this
    //scope(exit) surface.freeCapabilities(surfaceCapabilities);

    ColorTargetState[1] colorTargets = [
        {
            format: surfaceCapabilities.formats[0],
            writeMask: ColorWriteMask.all
        }
    ];

    FragmentState fragmentState = {
        module_: shaderModule,
        entryPoint: "fs_main".asStringView,
        targets: colorTargets
    };

    RenderPipelineDescriptor pipelineDesc = {
        layout: pipelineLayout,
        vertex: {module_: shaderModule,
        entryPoint: "vs_main".asStringView},
        fragment: &fragmentState,
        primitive: {topology: PrimitiveTopology.triangleList},
        multisample: {count: 1, mask: uint.max}
    };

    auto renderPipeline = device.createRenderPipeline(pipelineDesc);
    if (!renderPipeline) {
        writeln("Failed to get create render pipeline.");
        return 1;
    }

    int width, height;
    SDL_GetWindowSizeInPixels(window, &width, &height);

    SurfaceConfiguration surfaceConfig = {
        device: device,
        usage: TextureUsage.renderAttachment,
        format: surfaceCapabilities.formats[0],
        presentMode: PresentMode.fifo,
        alphaMode: surfaceCapabilities.alphaModes[0],
        width: cast(uint)width,
        height: cast(uint)height
    };
    surface.configure(surfaceConfig);

    Duration accum;
    MonoTime prevTime = MonoTime.currTime;

    bool running = true;

    enum frameDur = 1.dur!"seconds" / 60;

    mainLoop: while (true) {
        auto time = MonoTime.currTime;
        auto delta = time - prevTime;
        accum += delta;
        prevTime = time;

        SDL_GetWindowSizeInPixels(window, &width, &height);
        if (width > 0 && height > 0 && (surfaceConfig.width != width || surfaceConfig.height != height)) {
            surfaceConfig.width = cast(uint)width;
            surfaceConfig.height = cast(uint)height;
            surface.configure(surfaceConfig);
        }

        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            switch (event.type) {
                case SDL_EVENT_QUIT:
                    break mainLoop;
                default:
                    break;
            }
        }

        if (accum < frameDur) {
            Thread.sleep(frameDur - accum);
            continue;
        }

        accum = Duration.zero;

        SurfaceTexture surfaceTexture;

        // FIXME: find a better way to get the above to handle this automagically
        // or maybe just write manual wrappers around these weird ones?
        scope (exit)
            Texture.Uniq(surfaceTexture.texture); // wrap it so it gets dropped on destroy

        surface.getCurrentTexture(surfaceTexture);

        if (surfaceTexture.status == webgpu.webgpu.SurfaceGetCurrentTextureStatus.successOptimal ||
            surfaceTexture.status == webgpu.webgpu.SurfaceGetCurrentTextureStatus.successSuboptimal) {
            TextureViewDescriptor viewDesc;
            auto frameView = surfaceTexture.texture.createView(viewDesc);
            if (!frameView) {
                writeln("Failed to surface texture view");
                return 1;
            }

            CommandEncoderDescriptor encoderDesc;
            auto encoder = device.createCommandEncoder(encoderDesc);
            if (!encoder) {
                writeln("Failed to create encoder");
                return 1;
            }

            RenderPassColorAttachment[1] colorAttachments = [
                {
                    view: frameView,
                    loadOp: LoadOp.clear,
                    storeOp: StoreOp.store,
                    clearValue: Color(0.05, 0.05, 0.05, 1.0)
                }
            ];

            RenderPassDescriptor renderPassDesc = {
                colorAttachments: colorAttachments
            };

            {
                auto pass = encoder.beginRenderPass(renderPassDesc);
                if (!pass) {
                    writeln("Failed to begin render pass.");
                    return 1;
                }
                scope (exit)
                    pass.end();

                pass.setPipeline(renderPipeline);
                pass.draw(3, 1, 0, 0);
            }

            CommandBufferDescriptor cbDesc;
            auto cmdBuffer = encoder.finish(cbDesc);
            if (!cmdBuffer) {
                writeln("Failed to finish encoder (create command buffer).");
                return 1;
            }

            scope CommandBuffer.Handle[1] handles = [cmdBuffer.getHandle];
            queue.submit(handles);
            surface.present();
        }

        Thread.yield();
    }

    return 0;
}
