module webgpu.wgpu;

import webgpu.common;
import webgpu.webgpu;

/// Identifier for a particular call to @ref wgpuQueueSubmitForIndex. Can be
/// passed to @ref wgpuDevicePoll to block until a particular submission has
/// finished execution. This type is unique to wgpu-native; there is no analogue
/// in the WebGPU specification.
alias SubmissionIndex = ulong;

/// TODO
enum SType : wegpu.webgpu.SType {
    /// Identifies @ref WGPUDeviceExtras.
    deviceExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 1),
    /// Identifies @ref WGPUNativeLimits.
    nativeLimits = cast(wegpu.webgpu.SType)(0x0003_0000 | 2),
    /// Identifies @ref WGPUShaderSourceGLSL.
    shaderSourceGLSL = cast(wegpu.webgpu.SType)(0x0003_0000 | 3),
    /// Identifies @ref WGPUInstanceExtras.
    instanceExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 4),
    /// Identifies @ref WGPUBindGroupEntryExtras.
    bindGroupEntryExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 5),
    /// Identifies @ref WGPUBindGroupLayoutEntryExtras.
    bindGroupLayoutEntryExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 6),
    /// Identifies @ref WGPUQuerySetDescriptorExtras.
    querySetDescriptorExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 7),
    /// Identifies @ref WGPUSurfaceConfigurationExtras.
    surfaceConfigurationExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 8),
    /// Identifies @ref WGPUSurfaceSourceSwapChainPanel.
    surfaceSourceSwapChainPanel = cast(wegpu.webgpu.SType)(0x0003_0000 | 9),
    /// Identifies @ref WGPUPrimitiveStateExtras.
    primitiveStateExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 10),
    /// Identifies @ref WGPUSamplerDescriptorExtras.
    samplerDescriptorExtras = cast(wegpu.webgpu.SType)(0x0003_0000 | 11),
    /// Identifies @ref WGPUSurfaceSourceOhosNativeWindow.
    surfaceSourceOhosNativeWindow = cast(wegpu.webgpu.SType)(0x0003_0000 | 12),
}

/// FIXME: WGPUFeatureName =\u003e WGPUNativeFeature Native-only device
/// features. These extend the standard @c WGPUFeatureName values and can be
/// passed to @c WGPUDeviceDescriptor::requiredFeatures to request additional
/// capabilities when creating a device.
enum FeatureName : wegpu.webgpu.FeatureName {
    /// Allows the use of immediate data: small, fast blocks of memory that can
    /// be updated inside a render pass, compute pass, or render bundle encoder.
    /// Enables @ref wgpuRenderPassEncoderSetImmediates, @ref
    /// wgpuComputePassEncoderSetImmediates, @ref
    /// wgpuRenderBundleEncoderSetImmediates, non-zero @c immediateSize in @ref
    /// WGPUPipelineLayout, and non-zero @c maxImmediateSize in @ref WGPULimits.
    /// A block of immediate data can be declared in WGSL with @c
    /// var\u003cimmediate\u003e: @code struct Immediates { example: f32, }
    /// var\u003cimmediate\u003e c: Immediates; @endcode In GLSL, this
    /// corresponds to @c layout(immediates) @c uniform @c Name @c {..}.
    /// Supported platforms: - DX12 - Vulkan - Metal - OpenGL (emulated with
    /// uniforms) - WebGPU This is a web and native feature.
    immediates = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 1),
    /// Enables device-specific texture format features. By default only texture
    /// format properties as defined by the WebGPU specification are allowed.
    /// Enabling this feature flag extends the features of each format to the
    /// ones supported by the current device. Note that without this flag,
    /// read/write storage access is not allowed at all. This extension does not
    /// enable additional formats. Supported platforms: - Vulkan - DX12 - Metal
    /// This is a native only feature.
    textureAdapterSpecificFormatFeatures = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 2),
    /// Allows the use of a buffer containing the actual number of draw calls.
    /// Enables @ref wgpuRenderPassEncoderMultiDrawIndirectCount and @ref
    /// wgpuRenderPassEncoderMultiDrawIndexedIndirectCount. This feature being
    /// present also implies that all calls to @ref
    /// wgpuRenderPassEncoderMultiDrawIndirect and @ref
    /// wgpuRenderPassEncoderMultiDrawIndexedIndirect are not being emulated
    /// with a series of @c draw_indirect calls. Supported platforms: - DX12 -
    /// Vulkan 1.2+ (or VK_KHR_draw_indirect_count) This is a native only
    /// feature.
    multiDrawIndirectCount = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 4),
    /// Enables bindings of writable storage buffers and textures visible to
    /// vertex shaders. Note: some (tiled-based) platforms do not support vertex
    /// shaders with any side-effects. Supported platforms: - All This is a
    /// native only feature.
    vertexWritableStorage = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 5),
    /// Allows the user to create uniform arrays of textures in shaders: - WGSL:
    /// @c var @c textures: @c binding_array\u003ctexture_2d\u003cf32\u003e, @c
    /// 10\u003e - GLSL: @c uniform @c texture2D @c textures[10] If @ref
    /// WGPUNativeFeature_StorageResourceBindingArray is supported as well as
    /// this, the user may also create uniform arrays of storage textures. This
    /// capability allows them to exist and to be indexed by dynamically uniform
    /// values. Supported platforms: - DX12 - Metal (with MSL 2.0+ on macOS
    /// 10.13+) - Vulkan This is a native only feature.
    textureBindingArray = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 6),
    /// Allows shaders to index sampled texture and storage buffer resource
    /// arrays with dynamically non-uniform values: e.g. @c
    /// texture_array[vertex_data] In order to use this capability, the
    /// corresponding GLSL extension must be enabled: @c \\#extension @c
    /// GL_EXT_nonuniform_qualifier @c : @c require and then used either as @c
    /// nonuniformEXT qualifier in variable declaration or as @c nonuniformEXT
    /// constructor. WGSL and HLSL do not need any extension. Supported
    /// platforms: - DX12 - Metal (with MSL 2.0+ on macOS 10.13+) - Vulkan 1.2+
    /// (or VK_EXT_descriptor_indexing) This is a native only feature.
    sampledTextureAndStorageBufferArrayNonUniformIndexing = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 7),
    /// Enables use of Pipeline Statistics Queries. These queries report the
    /// count of various operations performed between the start and stop call.
    /// Use @ref wgpuRenderPassEncoderBeginPipelineStatisticsQuery / @ref
    /// wgpuRenderPassEncoderEndPipelineStatisticsQuery (or the compute pass
    /// equivalents) to start and stop a query. They must be resolved using @c
    /// wgpuCommandEncoderResolveQuerySet into a buffer. See @ref
    /// WGPUPipelineStatisticName for the list of available statistics.
    /// Supported platforms: - Vulkan - DX12 This is a native only feature.
    pipelineStatisticsQuery = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 8),
    /// Allows the user to create uniform arrays of storage buffers or textures
    /// in shaders, if @ref WGPUNativeFeature_BufferBindingArray or @ref
    /// WGPUNativeFeature_TextureBindingArray (respectively) is also supported.
    /// This capability allows them to exist and to be indexed by dynamically
    /// uniform values. Supported platforms: - Metal (with MSL 2.2+ on macOS
    /// 10.13+) - Vulkan This is a native only feature.
    storageResourceBindingArray = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 9),
    /// Allows the user to create bind groups containing arrays with fewer
    /// bindings than the @c WGPUBindGroupLayout requires. Supported platforms:
    /// - Vulkan - DX12 This is a native only feature.
    partiallyBoundBindingArray = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 10),
    /// Enables normalized 16-bit texture formats: @ref
    /// WGPUTextureFormat_R16Unorm, @ref WGPUTextureFormat_R16Snorm, @ref
    /// WGPUTextureFormat_RG16Unorm, @ref WGPUTextureFormat_RG16Snorm, @ref
    /// WGPUTextureFormat_RGBA16Unorm, @ref WGPUTextureFormat_RGBA16Snorm.
    /// Supported platforms: - Vulkan - DX12 - Metal This is a native only
    /// feature.
    textureFormat16bitNorm = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 11),
    /// Enables ASTC HDR family of compressed textures. Compressed textures
    /// sacrifice some quality in exchange for significantly reduced bandwidth
    /// usage. Support for this feature guarantees availability of @c COPY_SRC |
    /// @c COPY_DST | @c TEXTURE_BINDING for ASTC formats with the HDR channel
    /// type. @ref WGPUNativeFeature_TextureAdapterSpecificFormatFeatures may
    /// enable additional usages. Supported platforms: - Metal - Vulkan - OpenGL
    /// This is a native only feature.
    textureCompressionAstcHdr = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 12),
    /// Removes the WebGPU restriction that @c MAP_READ and @c MAP_WRITE buffer
    /// usages must be paired exclusively with @c COPY_DST and @c COPY_SRC
    /// respectively. This is only beneficial on systems that share memory
    /// between CPU and GPU. If enabled on a system that doesn't, this can
    /// severely hinder performance. Only use if you understand the
    /// consequences. Supported platforms: - Vulkan - DX12 - Metal This is a
    /// native only feature.
    mappablePrimaryBuffers = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 14),
    /// Allows the user to create arrays of buffers in shaders: - WGSL: @c
    /// var\u003cuniform\u003e @c buffer_array: @c array\u003cMyBuffer, @c
    /// 10\u003e - GLSL: @c uniform @c myBuffer @c { @c ... @c } @c
    /// buffer_array[10] This capability allows them to exist and to be indexed
    /// by dynamically uniform values. If @ref
    /// WGPUNativeFeature_StorageResourceBindingArray is supported as well as
    /// this, the user may also create arrays of storage buffers. Supported
    /// platforms: - Vulkan This is a native only feature.
    bufferBindingArray = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 15),
    /// Allows shaders to index storage texture resource arrays with dynamically
    /// non-uniform values. This is a native only feature.
    storageTextureArrayNonUniformIndexing = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 16),
    /// TODO
    addressModeClampToZero = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 17),
    /// TODO
    addressModeClampToBorder = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 18),
    /// Allows the user to set @ref WGPUPolygonMode_Line in @ref
    /// WGPUPrimitiveStateExtras::polygonMode. This allows drawing
    /// polygons/triangles as lines (wireframe) instead of filled. Supported
    /// platforms: - DX12 - Vulkan - Metal This is a native only feature.
    polygonModeLine = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 19),
    /// Allows the user to set @ref WGPUPolygonMode_Point in @ref
    /// WGPUPrimitiveStateExtras::polygonMode. This allows only drawing the
    /// vertices of polygons/triangles instead of filled. Supported platforms: -
    /// Vulkan This is a native only feature.
    polygonModePoint = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 20),
    /// Allows the user to enable overestimation conservative rasterization via
    /// @ref WGPUPrimitiveStateExtras::conservative. Processing of degenerate
    /// triangles/lines is hardware specific. Only triangles are supported.
    /// Supported platforms: - Vulkan This is a native only feature.
    conservativeRasterization = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 21),
    /// Enables clear to zero for textures. Supported platforms: - All This is a
    /// native only feature.
    clearTexture = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 22),
    /// Enables multiview render passes and `builtin(view_index)` in vertex/mesh
    /// shaders. Supported platforms: - Vulkan - Metal - DX12 - OpenGL (web
    /// only) This is a native only feature.
    multiview = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 24),
    /// Enables using 64-bit types for vertex attributes. Requires @ref
    /// WGPUNativeFeature_ShaderF64. This is a native only feature.
    vertexAttribute64bit = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 25),
    /// Allows for creation of textures of format @ref
    /// WGPUNativeTextureFormat_NV12. Supported platforms: - DX12 - Vulkan This
    /// is a native only feature.
    textureFormatNv12 = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 26),
    /// Allows for the creation of ray-tracing queries within shaders. @b
    /// EXPERIMENTAL: Features enabled by this may have major bugs and are
    /// expected to be subject to breaking changes. Supported platforms: -
    /// Vulkan This is a native only feature.
    rayQuery = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 28),
    /// Enables 64-bit floating point types in SPIR-V shaders. Note: even when
    /// supported by GPU hardware, 64-bit floating point operations are
    /// frequently between 16 and 64 @e times slower than equivalent operations
    /// on 32-bit floats. Supported platforms: - Vulkan This is a native only
    /// feature.
    shaderF64 = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 29),
    /// Allows shaders to use i16. Not currently supported in naga, only
    /// available through SPIR-V passthrough. Supported platforms: - Vulkan This
    /// is a native only feature.
    shaderI16 = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 30),
    /// Allows shaders to use the @c early_depth_test attribute. The attribute
    /// is applied to the fragment shader entry point and can be used in two
    /// ways: 1. Force early depth/stencil tests: - WGSL: @c
    /// \\@early_depth_test(force) - GLSL: @c layout(early_fragment_tests) @c
    /// in; 2. Provide a conservative depth specifier that allows an additional
    /// early depth test under certain conditions: - WGSL: @c
    /// \\@early_depth_test(greater_equal/less_equal/unchanged) - GLSL: @c
    /// layout(depth_\u003cgreater/less/unchanged\u003e) @c out @c float @c
    /// gl_FragDepth; Supported platforms: - Vulkan - GLES 3.1+ This is a native
    /// only feature.
    shaderEarlyDepthTest = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 32),
    /// Allows compute and fragment shaders to use the subgroup operation
    /// built-ins and perform subgroup operations (except barriers). Supported
    /// platforms: - Vulkan - DX12 - Metal This is a native only feature.
    subgroup = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 33),
    /// Allows vertex shaders to use the subgroup operation built-ins and
    /// perform subgroup operations (except barriers). Supported platforms: -
    /// Vulkan This is a native only feature.
    subgroupVertex = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 34),
    /// Allows compute shaders to use the subgroup barrier. Requires @ref
    /// WGPUNativeFeature_Subgroup. Without it, enables nothing. Supported
    /// platforms: - Vulkan - Metal This is a native only feature.
    subgroupBarrier = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 35),
    /// Allows for timestamp queries directly on command encoders. Implies @c
    /// WGPUFeatureName_TimestampQuery is supported. Supported platforms: -
    /// Vulkan - DX12 - Metal - OpenGL (with GL_ARB_timer_query) This is a
    /// native only feature.
    timestampQueryInsideEncoders = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 36),
    /// Allows for timestamp queries inside render and compute passes. Implies
    /// @c WGPUFeatureName_TimestampQuery and @ref
    /// WGPUNativeFeature_TimestampQueryInsideEncoders are supported. Enables
    /// @ref wgpuRenderPassEncoderWriteTimestamp and @ref
    /// wgpuComputePassEncoderWriteTimestamp. This is generally not available on
    /// tile-based rasterization GPUs. Supported platforms: - Vulkan - DX12 -
    /// Metal (AMD \u0026 Intel, not Apple GPUs) - OpenGL (with
    /// GL_ARB_timer_query) This is a native only feature.
    timestampQueryInsidePasses = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 37),
    /// Allows shaders to use i64 and u64. Supported platforms: - Vulkan - DX12
    /// (DXC only) - Metal (with MSL 2.3+) This is a native only feature.
    shaderInt64 = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 38),
    /// Allows shaders to use f32 atomic load, store, add, sub, and exchange.
    /// Supported platforms: - Metal (with MSL 3.0+ and Apple7+/Mac2) - Vulkan
    /// (with [VK_EXT_shader_atomic_float]) This is a native only feature.
    shaderFloat32Atomic = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 39),
    /// Enables image atomic fetch add, and, xor, or, min, and max for R32Uint
    /// and R32Sint textures. Supported platforms: - Vulkan - DX12 - Metal (with
    /// MSL 3.1+) This is a native only feature.
    textureAtomic = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 40),
    /// Allows for creation of textures of format @ref
    /// WGPUNativeTextureFormat_P010. Supported platforms: - DX12 - Vulkan This
    /// is a native only feature.
    textureFormatP010 = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 41),
    /// Allows the use of pipeline cache objects Supported platforms: - Vulkan
    /// Unimplemented Platforms: - DX12 - Metal
    pipelineCache = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 43),
    /// Allows shaders to use i64 and u64 atomic min and max. Supported
    /// platforms: - Vulkan (with VK_KHR_shader_atomic_int64) - DX12 (with SM
    /// 6.6+) - Metal (with MSL 2.4+) This is a native only feature.
    shaderInt64AtomicMinMax = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 44),
    /// Allows shaders to use all i64 and u64 atomic operations. Supported
    /// platforms: - Vulkan (with VK_KHR_shader_atomic_int64) - DX12 (with SM
    /// 6.6+) This is a native only feature.
    shaderInt64AtomicAllOps = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 45),
    /// Enables R64Uint image atomic min and max. Supported platforms: - Vulkan
    /// (with VK_EXT_shader_image_atomic_int64) - DX12 (with SM 6.6+) - Metal
    /// (with MSL 3.1+) This is a native only feature.
    textureInt64Atomic = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 48),
    /// Enables shader barycentric coordinates. Supported platforms: - Vulkan
    /// (with VK_KHR_fragment_shader_barycentric) - DX12 (with SM 6.1+) - Metal
    /// (with MSL 2.2+) This is a native only feature.
    shaderBarycentrics = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 55),
    /// Enables using multiview where not all texture array layers are rendered
    /// to in a single render pass/render pipeline. Making use of this feature
    /// also requires enabling `Features::MULTIVIEW`. Supported platforms -
    /// Vulkan - DX12 While metal supports this in theory, the behavior of
    /// `view_index` differs from vulkan and dx12 so the feature isn't exposed.
    selectiveMultiview = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 56),
    /// TODO
    multisampleArray = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 58),
    /// Enables cooperative matrix operations (also known as tensor cores on
    /// NVIDIA GPUs or simdgroup matrix operations on Apple GPUs). Cooperative
    /// matrices allow a workgroup to collectively load, store, and perform
    /// matrix multiply-accumulate operations on small tiles of data, enabling
    /// hardware-accelerated matrix math. @b EXPERIMENTAL: Features enabled by
    /// this may have major bugs and are expected to be subject to breaking
    /// changes. **Current limitations:** The implementation currently only
    /// supports 8x8 f32 matrices. On Vulkan, support is determined by querying
    /// `vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR` for configurations
    /// matching 8x8x8 f32. Most Vulkan implementations (NVIDIA, AMD) primarily
    /// support f16 inputs at larger sizes (e.g., 16x16), so Vulkan support may
    /// be limited. Supported platforms: - Metal (with MSL 2.3+ and
    /// Apple7+/Mac2+, using simdgroup matrix operations) - Vulkan (with
    /// [VK_KHR_cooperative_matrix](https://registry.khronos.org/vulkan/specs/latest/man/html/VK_KHR_cooperative_matrix.html),
    /// if 8x8 f32 is supported) This is a native only feature.
    cooperativeMatrix = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 59),
    /// Enables shader per-vertex attributes. Supported platforms: - Vulkan
    /// (with VK_KHR_fragment_shader_barycentric) This is a native only feature.
    shaderPerVertex = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 60),
    /// Enables shader `draw_index` builtin. Supported platforms: - GLES -
    /// Vulkan Potential platforms: - DX12 - Metal This is a native only
    /// feature.
    shaderDrawIndex = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 61),
    /// Allows the user to create arrays of acceleration structures in shaders:
    /// ex. - `var tlas: binding_array\u003cacceleration_structure, 10\u003e`
    /// (WGSL) This capability allows them to exist and to be indexed by
    /// dynamically uniform values. Supported platforms: - DX12 - Vulkan This is
    /// a native only feature.
    accelerationStructureBindingArray = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 62),
    /// Enables the `@coherent` memory decoration on storage buffer variables.
    /// Backend mapping: - Vulkan - DX12 - Metal (3.2+) - GLES (ES 3.1+ / GL
    /// 4.3+) This is a native only feature.
    memoryDecorationCoherent = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 63),
    /// Enables the `@volatile` memory decoration on storage buffer variables.
    /// Backend mapping: - Vulkan - GLES (ES 3.1+ / GL 4.3+) This is a native
    /// only feature.
    memoryDecorationVolatile = cast(wegpu.webgpu.FeatureName)(0x0003_0000 | 64),
}

/// TODO
enum LogLevel : uint {
    /// TODO
    off = 0,
    /// Only error messages.
    error = 1,
    /// Errors and warnings.
    warn = 2,
    /// Errors, warnings, and informational messages.
    info = 3,
    /// Errors, warnings, informational, and debug messages.
    debug_ = 4,
    /// All messages, including very verbose trace-level output.
    trace = 5,
}

/// Additional surface-get-current-texture status codes defined by wgpu-native.
/// These extend the standard @c WGPUSurfaceGetCurrentTextureStatus values.
enum SurfaceGetCurrentTextureStatus : wegpu.webgpu.SurfaceGetCurrentTextureStatus {
    /// The surface texture was not acquired because the window is occluded
    /// (e.g. minimized or fully covered by another window). No texture is
    /// returned and the @c texture field of @c WGPUSurfaceTexture will be NULL.
    /// The surface and swapchain remain valid -- there is no need to
    /// reconfigure or recreate the surface. Applications should skip rendering
    /// for the current frame and try again once the window is no longer
    /// occluded. If you are using a windowing library such as winit, listen for
    /// the window's "occluded" event and request a new redraw when the window
    /// becomes visible again. When does this occur? Currently this status is
    /// only produced by the Metal backend on macOS. When a window is not
    /// visible (checked via the @c NSWindow @c occlusionState property),
    /// acquiring the next drawable would block for up to one second waiting for
    /// vsync. wgpu-native returns @c Occluded instead to avoid that hang. Other
    /// backends (Vulkan, DX12, GL) do not currently report this status; an
    /// occluded window on those backends may produce @c
    /// WGPUSurfaceGetCurrentTextureStatus_Timeout or simply succeed normally.
    occluded = cast(wegpu.webgpu.SurfaceGetCurrentTextureStatus)(0x0003_0000 | 1),
}

/// TODO
enum Dx12Compiler : uint {
    /// TODO
    undefined = 0,
    /// Use the FXC (D3DCompile) shader compiler. The FXC compiler is old, slow,
    /// and unmaintained. However, it doesn't require any additional DLLs to be
    /// shipped with the application.
    fxc = 1,
    /// Use the DXC (DirectX Shader Compiler).
    dxc = 2,
}

/// TODO
enum Gles3MinorVersion : uint {
    /// TODO
    automatic = 0,
    /// Request an ES 3.0 context.
    version0 = 1,
    /// Request an ES 3.1 context.
    version1 = 2,
    /// Request an ES 3.2 context.
    version2 = 3,
}

/// TODO
enum PipelineStatisticName : uint {
    /// TODO
    vertexShaderInvocations = 0,
    /// Number of times the clipper is invoked. This is also the number of
    /// triangles output by the vertex shader.
    clipperInvocations = 1,
    /// Number of primitives that are not culled by the clipper. This is the
    /// number of triangles that are actually on screen and will be rasterized
    /// and rendered.
    clipperPrimitivesOut = 2,
    /// Number of times the fragment shader is invoked. Accounts for fragment
    /// shaders running in 2x2 blocks in order to get derivatives.
    fragmentShaderInvocations = 3,
    /// Number of times a compute shader is invoked. This will be equivalent to
    /// the dispatch count times the workgroup size.
    computeShaderInvocations = 4,
}

/// FIXME: WGPUQueryType =\u003e WGPUNativeQueryType
enum QueryType : wegpu.webgpu.QueryType {
    /// TODO
    pipelineStatistics = cast(wegpu.webgpu.QueryType)(0x0003_0000 | 0),
}

/// FIXME: V60 =\u003e V6_0, etc.
enum DxcMaxShaderModel : uint {
    /// TODO
    v60 = 0,
    /// Shader Model 6.1
    v61 = 1,
    /// Shader Model 6.2
    v62 = 2,
    /// Shader Model 6.3
    v63 = 3,
    /// Shader Model 6.4
    v64 = 4,
    /// Shader Model 6.5
    v65 = 5,
    /// Shader Model 6.6
    v66 = 6,
    /// Shader Model 6.7
    v67 = 7,
}

/// TODO
enum GLFenceBehaviour : uint {
    /// TODO
    normal = 0,
    /// Fences are short-circuited to always report completion immediately. This
    /// solves a specific issue that arose due to a bug in wgpu-core that made
    /// many WebGL programs work when they shouldn't have. If you have code that
    /// calls @ref wgpuDevicePoll with @c wait=true on WebGL, you may need to
    /// enable this option for "wait" to behave how you expect. When this is
    /// set, @c wgpuQueueOnCompletedWorkDone callbacks will fire the next time
    /// the device is polled, not when work is actually done on the GPU.
    autoFinish = 1,
}

/// TODO
enum Dx12SwapchainKind : uint {
    /// TODO
    undefined = 0,
    /// Use a DXGI swapchain created directly from the window's HWND. This does
    /// not support transparency but has better support from developer tooling
    /// such as RenderDoc.
    dxgiFromHwnd = 1,
    /// Use a DXGI swapchain created from a DirectComposition visual made
    /// automatically from the window's HWND. This creates a single @c
    /// IDCompositionVisual over the entire window. Supports transparency. If
    /// you want to manage the composition tree yourself, create your own device
    /// and composition and pass the relevant visual via the surface target.
    dxgiFromVisual = 2,
}

/// Discriminant for WGPUNativeDisplayHandle. Identifies which platform's
/// display connection is stored in the tagged union. Use @ref
/// WGPUNativeDisplayHandleType_None (the default when zero-initialized) when no
/// display handle is needed. Platforms with no display connection data
/// (Windows, macOS, iOS, Android) should use @ref
/// WGPUNativeDisplayHandleType_None.
enum DisplayHandleType : uint {
    /// No display handle provided.
    none = 0,
    /// X11 display connection via Xlib. See @ref WGPUXlibDisplayHandle.
    xlib = 1,
    /// X11 display connection via XCB. See @ref WGPUXcbDisplayHandle.
    xcb = 2,
    /// Wayland display connection. See @ref WGPUWaylandDisplayHandle.
    wayland = 3,
}

/// TODO
enum MemoryHints : uint {
    /// Same as Performance (the wgpu default).
    undefined = 0,
    /// Favor performance over memory usage.
    performance = 1,
    /// Favor memory usage over performance.
    memoryUsage = 2,
    /// Choose the suballocated memory block size range explicitly via @ref
    /// WGPUDeviceExtras::suballocatedDeviceMemoryBlockSizeStart and @ref
    /// WGPUDeviceExtras::suballocatedDeviceMemoryBlockSizeEnd.
    manual = 3,
}

/// TODO
enum PolygonMode : uint {
    /// TODO
    fill = 0,
    /// Polygons are drawn as line segments (wireframe). Requires @ref
    /// WGPUNativeFeature_PolygonModeLine.
    line = 1,
    /// Polygons are drawn as points (vertices only). Requires @ref
    /// WGPUNativeFeature_PolygonModePoint.
    point = 2,
}

/// FIXME: WGPUAddressMode =\u003e WGPUNativeAddressMode
enum AddressMode : wegpu.webgpu.AddressMode {
    /// TODO
    clampToBorder = cast(wegpu.webgpu.AddressMode)(0x0003_0000 | 4),
}

/// TODO
enum SamplerBorderColor : uint {
    /// TODO
    undefined = 0,
    /// TODO
    transparentBlack = 1,
    /// TODO
    opaqueBlack = 2,
    /// TODO
    opaqueWhite = 3,
    /// TODO
    zero = 4,
}

/// FIXME: WGPUTextureFormat =\u003e WGPUNativeTextureFormat
enum TextureFormat : wegpu.webgpu.TextureFormat {
    /// YUV 4:2:0 chroma subsampled format (NV12). Plane 0 contains R8Unorm
    /// luminance (Y), Plane 1 contains Rg8Unorm chrominance (UV) at half width
    /// and half height. Requires @ref WGPUNativeFeature_TextureFormatNv12.
    nV12 = cast(wegpu.webgpu.TextureFormat)(0x0003_0000 | 7),
    /// YUV 4:2:0 with 10 bits used from 16-bit channels (P010). Plane 0
    /// contains R16Unorm luminance (Y), Plane 1 contains Rg16Unorm chrominance
    /// (UV) at half width and half height.
    p010 = cast(wegpu.webgpu.TextureFormat)(0x0003_0000 | 8),
}


/// Bitflags selecting which graphics backends the @ref WGPUInstance should
/// enable. Pass in the @c backends field of @ref WGPUInstanceExtras.
struct InstanceBackend {
    mixin BitFlags!();

    /// All backends (the default when zero-initialized).
    enum all = typeof(this).init;
    /// Vulkan backend. Supported on Windows, Linux/Android, and macOS/iOS via
    /// Vulkan Portability.
    enum vulkan = typeof(this)[0];
    /// OpenGL / OpenGL ES backend. Supported on Linux/Android, the web via
    /// WebGL, and Windows/macOS via ANGLE.
    enum gL = typeof(this)[1];
    /// Metal backend. Supported on macOS and iOS.
    enum metal = typeof(this)[2];
    /// Direct3D 12 backend. Supported on Windows 10 and later.
    enum dX12 = typeof(this)[3];
    /// Browser WebGPU backend. Supported when targeting the web through
    /// WebAssembly.
    enum browserWebGPU = typeof(this)(0x0000000000000020);
    /// Primary (first-tier) backends: Vulkan, Metal, DX12, and BrowserWebGPU.
    enum primary = vulkan | metal | dX12 | browserWebGPU;
    /// Secondary (second-tier) backends: GL.
    enum secondary = gL;
}

/// Bitflags controlling instance debugging and validation behavior. These are
/// not part of the WebGPU standard. Pass in the @c flags field of @ref
/// WGPUInstanceExtras.
struct InstanceFlag {
    mixin BitFlags!();

    /// No flags set.
    enum empty = typeof(this).init;
    /// Generate debug information in shaders and objects. When using @ref
    /// WGPUInstanceFlag_WithEnv, takes value from the @c WGPU_DEBUG environment
    /// variable.
    enum debug_ = typeof(this)[0];
    /// Enable validation in the backend API, if possible: - On the DX12
    /// backend, this calls @c ID3D12Debug::EnableDebugLayer. - On the Vulkan
    /// backend, this enables the Vulkan Validation Layers. - On the GLES
    /// backend (Windows), this enables debug output. - On the GLES backend
    /// (non-Windows), this calls @c eglDebugMessageControlKHR. When using @ref
    /// WGPUInstanceFlag_WithEnv, takes value from the @c WGPU_VALIDATION
    /// environment variable.
    enum validation = typeof(this)[1];
    /// Don't pass labels to the backend API (wgpu-hal). When using @ref
    /// WGPUInstanceFlag_WithEnv, takes value from the @c
    /// WGPU_DISCARD_HAL_LABELS environment variable.
    enum discardHalLabels = typeof(this)[2];
    /// Whether wgpu should expose adapters that run on top of non-compliant
    /// adapters. Turning this on might mean that some of the functionality
    /// provided by the wgpu adapter/device is not working or broken. This
    /// mainly applies to a Vulkan driver's compliance version. If the major
    /// compliance version is 0, then the driver is ignored unless this flag is
    /// set. When using @ref WGPUInstanceFlag_WithEnv, takes value from the @c
    /// WGPU_ALLOW_UNDERLYING_NONCOMPLIANT_ADAPTER environment variable.
    enum allowUnderlyingNoncompliantAdapter = typeof(this)[3];
    /// Enable GPU-based validation. Implies @ref WGPUInstanceFlag_Validation.
    /// Currently only changes behavior on the DX12 and Vulkan backends. -
    /// D3D12: Called "GPU-based validation" (GBV). - Vulkan: Called
    /// "GPU-Assisted Validation" via VK_LAYER_KHRONOS_validation. When using
    /// @ref WGPUInstanceFlag_WithEnv, takes value from the @c
    /// WGPU_GPU_BASED_VALIDATION environment variable.
    enum gPUBasedValidation = typeof(this)[4];
    /// Validate indirect buffer content prior to issuing indirect
    /// draws/dispatches. This validation will transform indirect calls into
    /// no-ops if they are not valid. For example, @c
    /// dispatch_workgroups_indirect arguments must be less than the @c
    /// max_compute_workgroups_per_dimension device limit. When using @ref
    /// WGPUInstanceFlag_WithEnv, takes value from the @c
    /// WGPU_VALIDATION_INDIRECT_CALL environment variable.
    enum validationIndirectCall = typeof(this)[5];
    /// Enable automatic timestamp normalization. When enabled, @c
    /// wgpuCommandEncoderResolveQuerySet will automatically normalize
    /// timestamps to nanoseconds instead of returning raw timestamp values.
    /// This introduces a compute shader into the resolution of query sets. When
    /// enabled, the timestamp period returned by @ref
    /// wgpuQueueGetTimestampPeriod will always be @c 1.0.
    enum automaticTimestampNormalization = typeof(this)[6];
    /// Use the default flags for the current build configuration. In debug
    /// builds, this typically enables @ref WGPUInstanceFlag_Debug and @ref
    /// WGPUInstanceFlag_Validation.
    enum default_ = typeof(this)(0x0000000001000000);
    /// Convenience alias that enables @ref WGPUInstanceFlag_Debug and @ref
    /// WGPUInstanceFlag_Validation.
    enum debugging = typeof(this)(0x0000000002000000);
    /// Convenience alias that enables @ref WGPUInstanceFlag_Debug, @ref
    /// WGPUInstanceFlag_Validation, and @ref
    /// WGPUInstanceFlag_GPUBasedValidation.
    enum advancedDebugging = typeof(this)(0x0000000004000000);
    /// Modify the flags based on environment variables. Flags with environment
    /// variable support (e.g. @c WGPU_DEBUG, @c WGPU_VALIDATION) will be read
    /// from the process environment and applied on top of the explicitly set
    /// flags.
    enum withEnv = typeof(this)(0x0000000008000000);
}

/// Describes how shader bound checks should be performed.
struct ShaderRuntimeChecks {
    mixin BitFlags!();

    /// No runtime checks set.
    enum none = typeof(this).init;
    /// Enforce bounds checks in shaders, even if the underlying driver
    /// doesn’t support doing so natively.
    enum boundsChecks = typeof(this)[0];
    /// If not set, the caller MUST ensure that all passed shaders do not
    /// contain any infinite loops.
    enum forceLoopBounding = typeof(this)[1];
    /// If not set, the caller MUST ensure that in all passed shaders every
    /// function operating on a ray query must obey these rules (functions using
    /// wgsl naming).
    enum rayQueryInitializationTracking = typeof(this)[2];
    /// If not set, task shaders will not validate that the mesh shader grid
    /// they dispatch is within legal limits.
    enum taskShaderDispatchTracking = typeof(this)[3];
    /// If not set, mesh shaders won’t clamp the output primitives’ vertex
    /// indices, which can lead to undefined behavior and arbitrary memory
    /// access.
    enum meshShaderPrimitiveIndicesClamp = typeof(this)[4];
}


/// FIXME: remove WGPULogCallbackInfo, remove userdata2, userdata1 =\u003e
/// userdata
alias LogCallback = CallbackInfo!(false, LogLevel, StringView);
/// ditto
alias LogCallbackDelegate = void delegate(LogLevel level, scope StringView message);
/// ditto
alias LogCallbackFunc = extern(C) void function(LogLevel level, StringView message, void* userdata1, void* userdata2);
/// ditto
private extern(C) void invokeLogCallback(LogLevel level, StringView message, void* userdata1, void* userdata2) {
    LogCallbackDelegate dg;
    dg.funcptr = userdata1;
    dg.ptr = userdata2;
    dg(level, message);
}


/// TODO
void generateReport(scope Instance.Handle instance, scope ref GlobalReport report) @trusted nothrow @nogc {
    wgpuGenerateReport(instance, &report);
}
private extern(C) void wgpuGenerateReport(Instance.Handle, GlobalReport*) nothrow @nogc;

/// FIXME: swap arguments; make ret type void; `WGPULogCallbackInfo
/// callbackInfo` =\u003e `WGPULogCallback callback` Don't forget Proc pointer
/// as well!
void setLogCallback(void* userdata) @trusted nothrow @nogc {
    wgpuSetLogCallback(&userdata);
}
private extern(C) void wgpuSetLogCallback(void*) nothrow @nogc;

/// TODO
void setLogLevel(LogLevel level) @trusted nothrow @nogc {
    wgpuSetLogLevel(level);
}
private extern(C) void wgpuSetLogLevel(LogLevel) nothrow @nogc;

/// TODO
uint getVersion() @trusted nothrow @nogc {
    return wgpuGetVersion();
}
private extern(C) uint wgpuGetVersion() nothrow @nogc;


/// TODO
struct InstanceExtras {
    ChainableStruct chain = { sType: SType.instanceExtras };
    /// Which backends to enable. Zero (@ref WGPUInstanceBackend_All) enables
    /// all backends.
    InstanceBackend backends = InstanceBackend.init;
    /// Flags controlling debug/validation behavior. See @ref WGPUInstanceFlag
    /// for available flags.
    InstanceFlag flags = InstanceFlag.init;
    /// Which DX12 shader compiler to use. See @ref WGPUDx12Compiler. Ignored on
    /// non-DX12 backends.
    Dx12Compiler dx12ShaderCompiler = Dx12Compiler.undefined;
    /// Which OpenGL ES 3 minor version to request. See @ref
    /// WGPUGles3MinorVersion. Ignored on non-GL backends.
    Gles3MinorVersion gles3MinorVersion = cast(Gles3MinorVersion)0;
    /// Controls OpenGL fence synchronization behavior. See @ref
    /// WGPUGLFenceBehaviour. Ignored on non-GL backends.
    GLFenceBehaviour glFenceBehaviour = cast(GLFenceBehaviour)0;
    /// File system path to @c dxcompiler.dll for dynamic DXC loading. Only used
    /// when @c dx12ShaderCompiler is @ref WGPUDx12Compiler_Dxc. An
    /// empty/undefined string view means the DLL will be searched for on the
    /// system PATH.
    StringView dxcPath = StringView.init;
    /// Maximum HLSL shader model version that DXC should target. See @ref
    /// WGPUDxcMaxShaderModel. Only used with the DXC compiler.
    DxcMaxShaderModel dxcMaxShaderModel = cast(DxcMaxShaderModel)0;
    /// Which DX12 presentation system (swapchain kind) to use. See @ref
    /// WGPUDx12SwapchainKind. Ignored on non-DX12 backends.
    Dx12SwapchainKind dx12PresentationSystem = Dx12SwapchainKind.undefined;
    /// TODO
    const(ubyte)* budgetForDeviceCreation = null;
    /// TODO
    const(ubyte)* budgetForDeviceLoss = null;
    /// Platform display connection to associate with this instance.
    /// Zero-initialized yields @ref WGPUNativeDisplayHandleType_None (no
    /// handle).
    DisplayHandle displayHandle = DisplayHandle.init;
}

/// TODO
struct DeviceExtras {
    ChainableStruct chain = { sType: SType.deviceExtras };
    /// File system path for API trace output. When set to a non-empty path,
    /// wgpu will record all API calls to the given directory, which can later
    /// be replayed for debugging. An empty/undefined string view disables
    /// tracing.
    StringView tracePath = StringView.init;
    /// Hints to the backend memory allocator. Zero-initialized yields @ref
    /// WGPUMemoryHints_Undefined (Performance).
    MemoryHints memoryHints = MemoryHints.undefined;
    /// Initial suballocated device-memory block size, in bytes. Only used with
    /// @ref WGPUMemoryHints_Manual. After running out of space in existing
    /// blocks, the backend may grow subsequent block sizes up to @ref
    /// WGPUDeviceExtras::suballocatedDeviceMemoryBlockSizeEnd. This does not
    /// limit resource sizes: a resource that does not fit is typically placed
    /// in a dedicated memory block.
    ulong suballocatedDeviceMemoryBlockSizeStart = 0;
    /// See @ref WGPUDeviceExtras::suballocatedDeviceMemoryBlockSizeStart.
    ulong suballocatedDeviceMemoryBlockSizeEnd = 0;
}

/// TODO
struct NativeLimits {
    ChainableStruct chain = { sType: SType.nativeLimits };
    /// Maximum number of live non-sampler bindings. Default is 1,000,000. Only
    /// meaningful on D3D12. @b Warning: On integrated GPUs, large values can
    /// cause significant system RAM consumption.
    uint maxNonSamplerBindings = LIMIT_U32_UNDEFINED;
    /// Maximum number of individual resources within binding arrays that can be
    /// accessed in a single shader stage. Applies to all types of bindings
    /// except samplers.
    uint maxBindingArrayElementsPerShaderStage = LIMIT_U32_UNDEFINED;
    /// Maximum number of individual samplers within binding arrays that can be
    /// accessed in a single shader stage.
    uint maxBindingArraySamplerElementsPerShaderStage = LIMIT_U32_UNDEFINED;
    /// The maximum number of views that can be used in multiview rendering.
    uint maxMultiviewViewCount = LIMIT_U32_UNDEFINED;
}

/// TODO
struct ShaderDefine {
    /// TODO
    StringView name = StringView.init;
    /// The value of the preprocessor macro (e.g. @c "1").
    StringView value = StringView.init;
}

/// TODO
struct ShaderSourceGLSL {
    ChainableStruct chain = { sType: SType.shaderSourceGLSL };
    /// The shader stage this GLSL source targets.
    ShaderStage stage = ShaderStage.init;
    /// GLSL source code.
    StringView code = StringView.init;
    /// FIXME: count type size_t =\u003e uint32_t
    const(ShaderDefine)[] defines = null;
}

/// TODO
struct ShaderModuleDescriptorSpirV {
    /// TODO
    StringView label = StringView.init;
    /// Number of 32-bit words in @c source.
    uint sourceSize = 0;
    /// TODO
    const(uint)* source = null;
}

/// TODO
struct RegistryReport {
    /// TODO
    size_t numAllocated = 0;
    /// TODO
    size_t numKeptFromUser = 0;
    /// TODO
    size_t numReleasedFromUser = 0;
    /// TODO
    size_t elementSize = 0;
}

/// TODO
struct HubReport {
    /// TODO
    RegistryReport adapters = RegistryReport.init;
    /// TODO
    RegistryReport devices = RegistryReport.init;
    /// TODO
    RegistryReport queues = RegistryReport.init;
    /// TODO
    RegistryReport pipelineLayouts = RegistryReport.init;
    /// TODO
    RegistryReport shaderModules = RegistryReport.init;
    /// TODO
    RegistryReport bindGroupLayouts = RegistryReport.init;
    /// TODO
    RegistryReport bindGroups = RegistryReport.init;
    /// TODO
    RegistryReport commandBuffers = RegistryReport.init;
    /// TODO
    RegistryReport renderBundles = RegistryReport.init;
    /// TODO
    RegistryReport renderPipelines = RegistryReport.init;
    /// TODO
    RegistryReport computePipelines = RegistryReport.init;
    /// TODO
    RegistryReport pipelineCaches = RegistryReport.init;
    /// TODO
    RegistryReport querySets = RegistryReport.init;
    /// TODO
    RegistryReport buffers = RegistryReport.init;
    /// TODO
    RegistryReport textures = RegistryReport.init;
    /// TODO
    RegistryReport textureViews = RegistryReport.init;
    /// TODO
    RegistryReport samplers = RegistryReport.init;
}

/// TODO
struct GlobalReport {
    /// TODO
    RegistryReport surfaces = RegistryReport.init;
    /// Statistics for all other resource types, grouped by backend hub.
    HubReport hub = HubReport.init;
}

/// TODO
struct InstanceEnumerateAdapterOptions {
    ChainableStruct* nextInChain;
    /// TODO
    InstanceBackend backends = InstanceBackend.init;
}

/// TODO
struct BindGroupEntryExtras {
    ChainableStruct chain = { sType: SType.bindGroupEntryExtras };
    /// FIXME: swap count and pointer
    const(Buffer.Handle)[] buffers = null;
    /// FIXME: swap count and pointer
    const(Sampler.Handle)[] samplers = null;
    /// FIXME: swap count and pointer
    const(TextureView.Handle)[] textureViews = null;
}

/// TODO
struct BindGroupLayoutEntryExtras {
    ChainableStruct chain = { sType: SType.bindGroupLayoutEntryExtras };
    /// Number of resources in this binding array slot. Corresponds to the array
    /// size in the shader (e.g. @c binding_array\u003cT, @c N\u003e).
    uint count = 0;
}

/// TODO
struct QuerySetDescriptorExtras {
    ChainableStruct chain = { sType: SType.querySetDescriptorExtras };
    /// FIXME: swap count and pointer
    const(PipelineStatisticName)[] pipelineStatistics = null;
}

/// TODO
struct SurfaceConfigurationExtras {
    ChainableStruct chain = { sType: SType.surfaceConfigurationExtras };
    /// Desired maximum number of frames in flight (i.e. the number of monitor
    /// refreshes between @c wgpuSurfaceGetCurrentTexture and presentation). -
    /// 1: Minimize latency (CPU and GPU cannot run in parallel). - 2: Balance
    /// between latency and throughput (the default). - 3+: Maximize throughput.
    uint desiredMaximumFrameLatency = 0;
}

/// Chained in @ref WGPUSurfaceDescriptor to make a @ref WGPUSurface wrapping a
/// WinUI
/// [`SwapChainPanel`](https://learn.microsoft.com/en-us/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.controls.swapchainpanel).
struct SurfaceSourceSwapChainPanel {
    ChainableStruct chain = { sType: SType.surfaceSourceSwapChainPanel };
    /// A pointer to the
    /// [`ISwapChainPanelNative`](https://learn.microsoft.com/en-us/windows/windows-app-sdk/api/win32/microsoft.ui.xaml.media.dxinterop/nn-microsoft-ui-xaml-media-dxinterop-iswapchainpanelnative)
    /// interface of the SwapChainPanel that will be wrapped by the @ref
    /// WGPUSurface.
    void* panelNative = null;
}

/// TODO
struct PrimitiveStateExtras {
    ChainableStruct chain = { sType: SType.primitiveStateExtras };
    /// Controls the way each polygon is rasterized. See @ref WGPUPolygonMode.
    /// Defaults to @ref WGPUPolygonMode_Fill.
    PolygonMode polygonMode = cast(PolygonMode)0;
    /// If set to true, the primitives are rendered with conservative
    /// overestimation. Only valid when @c polygonMode is @ref
    /// WGPUPolygonMode_Fill. Requires @ref
    /// WGPUNativeFeature_ConservativeRasterization.
    Bool conservative = false;
}

/// Chained in @ref WGPUSurfaceDescriptor to make a @ref WGPUSurface wrapping an
/// OpenHarmony @c OHNativeWindow.
struct SurfaceSourceOhosNativeWindow {
    ChainableStruct chain = { sType: SType.surfaceSourceOhosNativeWindow };
    /// A pointer to an OpenHarmony @c OHNativeWindow. Must not be NULL.
    void* window = null;
}

/// Xlib display connection data for @ref WGPUNativeDisplayHandle.
struct XlibDisplayHandle {
    /// Pointer to the X11 @c Display (i.e. @c Display*). Must not be NULL.
    void* display = null;
    /// X11 screen number.
    int screen = 0;
}

/// XCB display connection data for @ref WGPUNativeDisplayHandle.
struct XcbDisplayHandle {
    /// Pointer to the XCB connection (i.e. @c xcb_connection_t*). Must not be
    /// NULL.
    void* connection = null;
    /// X11 screen number.
    int screen = 0;
}

/// Wayland display connection data for @ref WGPUNativeDisplayHandle.
struct WaylandDisplayHandle {
    /// Pointer to the Wayland display (i.e. @c wl_display*). Must not be NULL.
    void* display = null;
}

/// FIXME: Needs `data` union Platform display connection, passed as a field of
/// @ref WGPUInstanceExtras. This is a tagged union. Set @c type to indicate
/// which variant is active, then populate the corresponding field in @c data.
/// Zero-initialization yields @ref WGPUNativeDisplayHandleType_None, meaning no
/// display handle is provided. Currently required by the GLES backend when
/// presenting on Wayland. Other backends ignore this field. If the instance is
/// created with a display handle, all surfaces created from it must use the
/// same display connection.
struct DisplayHandle {
    /// TODO
    DisplayHandleType type = cast(DisplayHandleType)0;
    /// TODO
    XlibDisplayHandle xlib = XlibDisplayHandle.init;
    /// TODO
    XcbDisplayHandle xcb = XcbDisplayHandle.init;
    /// TODO
    WaylandDisplayHandle wayland = WaylandDisplayHandle.init;
}

/// TODO
struct ImageSubresourceRange {
    /// TODO
    TextureAspect aspect = TextureAspect.undefined;
    /// TODO
    uint baseMipLevel = 0;
    /// TODO
    uint mipLevelCount = 0;
    /// TODO
    uint baseArrayLayer = 0;
    /// TODO
    uint arrayLayerCount = 0;
}

/// TODO
struct SamplerDescriptorExtras {
    ChainableStruct chain = { sType: SType.samplerDescriptorExtras };
    /// TODO
    SamplerBorderColor samplerBorderColor = SamplerBorderColor.undefined;
}


// `Instance` extensions

/// TODO
size_t enumerateAdapters(scope Instance.Handle self, scope ref const InstanceEnumerateAdapterOptions options, scope ref Adapter.Handle adapters) @trusted nothrow @nogc {
    return wgpuInstanceEnumerateAdapters(self, &options, &adapters);
}
private extern(C) size_t wgpuInstanceEnumerateAdapters(Instance.Handle, const(InstanceEnumerateAdapterOptions)*, Adapter.Handle*) nothrow @nogc;



// `Queue` extensions

/// TODO
SubmissionIndex submitForIndex(scope Queue.Handle self, scope const(CommandBuffer.Handle)[] commands) @trusted nothrow @nogc {
    return wgpuQueueSubmitForIndex(self, commands.length, commands.ptr);
}
private extern(C) SubmissionIndex wgpuQueueSubmitForIndex(Queue.Handle, size_t, const(CommandBuffer.Handle)*) nothrow @nogc;

/// TODO
float getTimestampPeriod(scope Queue.Handle self) @trusted nothrow @nogc {
    return wgpuQueueGetTimestampPeriod(self);
}
private extern(C) float wgpuQueueGetTimestampPeriod(Queue.Handle) nothrow @nogc;

/// Returns the backend-native `id\u003cMTLCommandQueue\u003e` as an opaque
/// pointer. The returned pointer is borrowed and remains valid only while
/// `queue` is alive. Ownership is retained by wgpu-native; callers must not
/// release or destroy it. Returns NULL when the active backend is not Metal or
/// when the handle is unavailable.
void* getNativeMetalCommandQueue(scope Queue.Handle self) @trusted nothrow @nogc {
    return wgpuQueueGetNativeMetalCommandQueue(self);
}
private extern(C) void* wgpuQueueGetNativeMetalCommandQueue(Queue.Handle) nothrow @nogc;



// `Device` extensions

/// Returns true if the queue is empty, or false if there are more queue
/// submissions still in flight.
bool poll(scope Device.Handle self, bool wait, scope ref const SubmissionIndex submissionIndex) @trusted nothrow @nogc {
    return wgpuDevicePoll(self, wait, &submissionIndex) != 0;
}
private extern(C) uint wgpuDevicePoll(Device.Handle, uint, const(SubmissionIndex)*) nothrow @nogc;

/// TODO
ShaderModule.Uniq createShaderModuleSpirV(scope Device.Handle self, scope ref const ShaderModuleDescriptorSpirV descriptor) @trusted nothrow @nogc {
    return ShaderModule.Uniq(wgpuDeviceCreateShaderModuleSpirV(self, &descriptor));
}
private extern(C) ShaderModule.Handle wgpuDeviceCreateShaderModuleSpirV(Device.Handle, const(ShaderModuleDescriptorSpirV)*) nothrow @nogc;

/// Returns the backend-native `id\u003cMTLDevice\u003e` as an opaque pointer.
/// The returned pointer is borrowed and remains valid only while `device` is
/// alive. Ownership is retained by wgpu-native; callers must not release or
/// destroy it. Returns NULL when the active backend is not Metal or when the
/// handle is unavailable.
void* getNativeMetalDevice(scope Device.Handle self) @trusted nothrow @nogc {
    return wgpuDeviceGetNativeMetalDevice(self);
}
private extern(C) void* wgpuDeviceGetNativeMetalDevice(Device.Handle) nothrow @nogc;

/// Returns true if the capture was successfully started, or false if it failed
/// to start or is not supported on the current platform.
bool startGraphicsDebuggerCapture(scope Device.Handle self) @trusted nothrow @nogc {
    return wgpuDeviceStartGraphicsDebuggerCapture(self) != 0;
}
private extern(C) uint wgpuDeviceStartGraphicsDebuggerCapture(Device.Handle) nothrow @nogc;

/// TODO
void stopGraphicsDebuggerCapture(scope Device.Handle self) @trusted nothrow @nogc {
    wgpuDeviceStopGraphicsDebuggerCapture(self);
}
private extern(C) void wgpuDeviceStopGraphicsDebuggerCapture(Device.Handle) nothrow @nogc;

/// TODO
ShaderModule.Uniq createShaderModuleTrusted(scope Device.Handle self, scope ref const ShaderModuleDescriptor descriptor, ShaderRuntimeChecks runtimeChecks) @trusted nothrow @nogc {
    return ShaderModule.Uniq(wgpuDeviceCreateShaderModuleTrusted(self, &descriptor, runtimeChecks));
}
private extern(C) ShaderModule.Handle wgpuDeviceCreateShaderModuleTrusted(Device.Handle, const(ShaderModuleDescriptor)*, ShaderRuntimeChecks) nothrow @nogc;



// `Texture` extensions

/// Returns the backend-native `id\u003cMTLTexture\u003e` as an opaque pointer.
/// The returned pointer is borrowed and remains valid only while `texture` is
/// alive. Ownership is retained by wgpu-native; callers must not release or
/// destroy it. Returns NULL when the active backend is not Metal or when the
/// handle is unavailable.
void* getNativeMetalTexture(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetNativeMetalTexture(self);
}
private extern(C) void* wgpuTextureGetNativeMetalTexture(Texture.Handle) nothrow @nogc;



// `RenderPassEncoder` extensions

/// TODO
void multiDrawIndirect(scope RenderPassEncoder.Handle self, scope Buffer.Handle buffer, ulong offset, uint count) @trusted nothrow @nogc {
    wgpuRenderPassEncoderMultiDrawIndirect(self, buffer, offset, count);
}
private extern(C) void wgpuRenderPassEncoderMultiDrawIndirect(RenderPassEncoder.Handle, Buffer.Handle, ulong, uint) nothrow @nogc;

/// TODO
void multiDrawIndexedIndirect(scope RenderPassEncoder.Handle self, scope Buffer.Handle buffer, ulong offset, uint count) @trusted nothrow @nogc {
    wgpuRenderPassEncoderMultiDrawIndexedIndirect(self, buffer, offset, count);
}
private extern(C) void wgpuRenderPassEncoderMultiDrawIndexedIndirect(RenderPassEncoder.Handle, Buffer.Handle, ulong, uint) nothrow @nogc;

/// TODO
void multiDrawIndirectCount(scope RenderPassEncoder.Handle self, scope Buffer.Handle buffer, ulong offset, scope Buffer.Handle countBuffer, ulong countBufferOffset, uint maxCount) @trusted nothrow @nogc {
    wgpuRenderPassEncoderMultiDrawIndirectCount(self, buffer, offset, countBuffer, countBufferOffset, maxCount);
}
private extern(C) void wgpuRenderPassEncoderMultiDrawIndirectCount(RenderPassEncoder.Handle, Buffer.Handle, ulong, Buffer.Handle, ulong, uint) nothrow @nogc;

/// TODO
void multiDrawIndexedIndirectCount(scope RenderPassEncoder.Handle self, scope Buffer.Handle buffer, ulong offset, scope Buffer.Handle countBuffer, ulong countBufferOffset, uint maxCount) @trusted nothrow @nogc {
    wgpuRenderPassEncoderMultiDrawIndexedIndirectCount(self, buffer, offset, countBuffer, countBufferOffset, maxCount);
}
private extern(C) void wgpuRenderPassEncoderMultiDrawIndexedIndirectCount(RenderPassEncoder.Handle, Buffer.Handle, ulong, Buffer.Handle, ulong, uint) nothrow @nogc;

/// TODO
void beginPipelineStatisticsQuery(scope RenderPassEncoder.Handle self, scope QuerySet.Handle querySet, uint queryIndex) @trusted nothrow @nogc {
    wgpuRenderPassEncoderBeginPipelineStatisticsQuery(self, querySet, queryIndex);
}
private extern(C) void wgpuRenderPassEncoderBeginPipelineStatisticsQuery(RenderPassEncoder.Handle, QuerySet.Handle, uint) nothrow @nogc;

/// TODO
void endPipelineStatisticsQuery(scope RenderPassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuRenderPassEncoderEndPipelineStatisticsQuery(self);
}
private extern(C) void wgpuRenderPassEncoderEndPipelineStatisticsQuery(RenderPassEncoder.Handle) nothrow @nogc;

/// TODO
void writeTimestamp(scope RenderPassEncoder.Handle self, scope QuerySet.Handle querySet, uint queryIndex) @trusted nothrow @nogc {
    wgpuRenderPassEncoderWriteTimestamp(self, querySet, queryIndex);
}
private extern(C) void wgpuRenderPassEncoderWriteTimestamp(RenderPassEncoder.Handle, QuerySet.Handle, uint) nothrow @nogc;



// `ComputePassEncoder` extensions

/// TODO
void beginPipelineStatisticsQuery(scope ComputePassEncoder.Handle self, scope QuerySet.Handle querySet, uint queryIndex) @trusted nothrow @nogc {
    wgpuComputePassEncoderBeginPipelineStatisticsQuery(self, querySet, queryIndex);
}
private extern(C) void wgpuComputePassEncoderBeginPipelineStatisticsQuery(ComputePassEncoder.Handle, QuerySet.Handle, uint) nothrow @nogc;

/// TODO
void endPipelineStatisticsQuery(scope ComputePassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuComputePassEncoderEndPipelineStatisticsQuery(self);
}
private extern(C) void wgpuComputePassEncoderEndPipelineStatisticsQuery(ComputePassEncoder.Handle) nothrow @nogc;

/// TODO
void writeTimestamp(scope ComputePassEncoder.Handle self, scope QuerySet.Handle querySet, uint queryIndex) @trusted nothrow @nogc {
    wgpuComputePassEncoderWriteTimestamp(self, querySet, queryIndex);
}
private extern(C) void wgpuComputePassEncoderWriteTimestamp(ComputePassEncoder.Handle, QuerySet.Handle, uint) nothrow @nogc;



// `CommandEncoder` extensions

/// TODO
void clearTexture(scope CommandEncoder.Handle self, scope Texture.Handle texture, scope ref const ImageSubresourceRange range) @trusted nothrow @nogc {
    wgpuCommandEncoderClearTexture(self, texture, &range);
}
private extern(C) void wgpuCommandEncoderClearTexture(CommandEncoder.Handle, Texture.Handle, const(ImageSubresourceRange)*) nothrow @nogc;



