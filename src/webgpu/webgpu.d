module webgpu.webgpu;

import webgpu.common;

/// Indicates no array layer count is specified. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum ARRAY_LAYER_COUNT_UNDEFINED = uint.max;
/// Indicates no copy stride is specified. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum COPY_STRIDE_UNDEFINED = uint.max;
/// Indicates no depth clear value is specified. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum DEPTH_CLEAR_VALUE_UNDEFINED = float.nan;
/// Indicates no depth slice is specified. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum DEPTH_SLICE_UNDEFINED = uint.max;
/// For `uint32_t` limits, indicates no limit value is specified. For more info,
/// see @ref SentinelValues and the places that use this sentinel value.
enum LIMIT_U32_UNDEFINED = uint.max;
/// For `uint64_t` limits, indicates no limit value is specified. For more info,
/// see @ref SentinelValues and the places that use this sentinel value.
enum LIMIT_U64_UNDEFINED = ulong.max;
/// Indicates no mip level count is specified. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum MIP_LEVEL_COUNT_UNDEFINED = uint.max;
/// Indicates no query set index is specified. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum QUERY_SET_INDEX_UNDEFINED = uint.max;
/// Sentinel value used in @ref WGPUStringView to indicate that the pointer is
/// to a null-terminated string, rather than an explicitly-sized string.
enum STRLEN = size_t.max;
/// Indicates a size extending to the end of the buffer. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum WHOLE_MAP_SIZE = size_t.max;
/// Indicates a size extending to the end of the buffer. For more info, see @ref
/// SentinelValues and the places that use this sentinel value.
enum WHOLE_SIZE = ulong.max;

/// TODO
enum AdapterType : uint {
    /// TODO
    discreteGPU = 1,
    /// TODO
    integratedGPU = 2,
    /// TODO
    CPU = 3,
    /// TODO
    unknown = 4,
}

/// TODO
enum AddressMode : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    clampToEdge = 1,
    /// TODO
    repeat = 2,
    /// TODO
    mirrorRepeat = 3,
}

/// TODO
enum BackendType : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    null_ = 1,
    /// TODO
    WebGPU = 2,
    /// TODO
    D3D11 = 3,
    /// TODO
    D3D12 = 4,
    /// TODO
    metal = 5,
    /// TODO
    vulkan = 6,
    /// TODO
    openGL = 7,
    /// TODO
    openGLES = 8,
}

/// TODO
enum BlendFactor : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    zero = 1,
    /// TODO
    one = 2,
    /// TODO
    src = 3,
    /// TODO
    oneMinusSrc = 4,
    /// TODO
    srcAlpha = 5,
    /// TODO
    oneMinusSrcAlpha = 6,
    /// TODO
    dst = 7,
    /// TODO
    oneMinusDst = 8,
    /// TODO
    dstAlpha = 9,
    /// TODO
    oneMinusDstAlpha = 10,
    /// TODO
    srcAlphaSaturated = 11,
    /// TODO
    constant = 12,
    /// TODO
    oneMinusConstant = 13,
    /// TODO
    src1 = 14,
    /// TODO
    oneMinusSrc1 = 15,
    /// TODO
    src1Alpha = 16,
    /// TODO
    oneMinusSrc1Alpha = 17,
}

/// TODO
enum BlendOperation : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    add = 1,
    /// TODO
    subtract = 2,
    /// TODO
    reverseSubtract = 3,
    /// TODO
    min = 4,
    /// TODO
    max = 5,
}

/// TODO
enum BufferBindingType : uint {
    /// Indicates that this @ref WGPUBufferBindingLayout member of its parent
    /// @ref WGPUBindGroupLayoutEntry is not used. (See also @ref
    /// SentinelValues.)
    bindingNotUsed = 0,
    /// `1`. Indicates no value is passed for this argument. See @ref
    /// SentinelValues.
    undefined = 1,
    /// TODO
    uniform = 2,
    /// TODO
    storage = 3,
    /// TODO
    readOnlyStorage = 4,
}

/// TODO
enum BufferMapState : uint {
    /// TODO
    unmapped = 1,
    /// TODO
    pending = 2,
    /// TODO
    mapped = 3,
}

/// The callback mode controls how a callback for an asynchronous operation may
/// be fired. See @ref Asynchronous-Operations for how these are used.
enum CallbackMode : uint {
    /// Callbacks created with `WGPUCallbackMode_WaitAnyOnly`: - fire when the
    /// asynchronous operation's future is passed to a call to @ref
    /// wgpuInstanceWaitAny AND the operation has already completed or it
    /// completes inside the call to @ref wgpuInstanceWaitAny.
    waitAnyOnly = 1,
    /// Callbacks created with `WGPUCallbackMode_AllowProcessEvents`: - fire for
    /// the same reasons as callbacks created with
    /// `WGPUCallbackMode_WaitAnyOnly` - fire inside a call to @ref
    /// wgpuInstanceProcessEvents if the asynchronous operation is complete.
    allowProcessEvents = 2,
    /// Callbacks created with `WGPUCallbackMode_AllowSpontaneous`: - fire for
    /// the same reasons as callbacks created with
    /// `WGPUCallbackMode_AllowProcessEvents` - **may** fire spontaneously on an
    /// arbitrary or application thread, when the WebGPU implementations
    /// discovers that the asynchronous operation is complete. Implementations
    /// _should_ fire spontaneous callbacks as soon as possible. @note Because
    /// spontaneous callbacks may fire at an arbitrary time on an arbitrary
    /// thread, applications should take extra care when acquiring locks or
    /// mutating state inside the callback. It undefined behavior to
    /// re-entrantly call into the webgpu.h API if the callback fires while
    /// inside the callstack of another webgpu.h function that is not
    /// `wgpuInstanceWaitAny` or `wgpuInstanceProcessEvents`.
    allowSpontaneous = 3,
}

/// TODO
enum CompareFunction : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    never = 1,
    /// TODO
    less = 2,
    /// TODO
    equal = 3,
    /// TODO
    lessEqual = 4,
    /// TODO
    greater = 5,
    /// TODO
    notEqual = 6,
    /// TODO
    greaterEqual = 7,
    /// TODO
    always = 8,
}

/// TODO
enum CompilationInfoRequestStatus : uint {
    /// TODO
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
}

/// TODO
enum CompilationMessageType : uint {
    /// TODO
    error = 1,
    /// TODO
    warning = 2,
    /// TODO
    info = 3,
}

/// TODO
enum ComponentSwizzle : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// Force its value to 0.
    zero = 1,
    /// Force its value to 1.
    one = 2,
    /// Take its value from the red channel of the texture.
    r = 3,
    /// Take its value from the green channel of the texture.
    g = 4,
    /// Take its value from the blue channel of the texture.
    b = 5,
    /// Take its value from the alpha channel of the texture.
    a = 6,
}

/// Describes how frames are composited with other contents on the screen when
/// @ref wgpuSurfacePresent is called.
enum CompositeAlphaMode : uint {
    /// Lets the WebGPU implementation choose the best mode (supported, and with
    /// the best performance) between @ref WGPUCompositeAlphaMode_Opaque or @ref
    /// WGPUCompositeAlphaMode_Inherit.
    auto_ = 0,
    /// The alpha component of the image is ignored and teated as if it is
    /// always 1.0.
    opaque = 1,
    /// The alpha component is respected and non-alpha components are assumed to
    /// be already multiplied with the alpha component. For example, (0.5, 0, 0,
    /// 0.5) is semi-transparent bright red.
    premultiplied = 2,
    /// The alpha component is respected and non-alpha components are assumed to
    /// NOT be already multiplied with the alpha component. For example, (1.0,
    /// 0, 0, 0.5) is semi-transparent bright red.
    unpremultiplied = 3,
    /// The handling of the alpha component is unknown to WebGPU and should be
    /// handled by the application using system-specific APIs. This mode may be
    /// unavailable (for example on Wasm).
    inherit = 4,
}

/// TODO
enum CreatePipelineAsyncStatus : uint {
    /// TODO
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
    /// TODO
    validationError = 3,
    /// TODO
    internalError = 4,
}

/// TODO
enum CullMode : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    none = 1,
    /// TODO
    front = 2,
    /// TODO
    back = 3,
}

/// TODO
enum DeviceLostReason : uint {
    /// TODO
    unknown = 1,
    /// TODO
    destroyed = 2,
    /// See @ref CallbackStatuses.
    callbackCancelled = 3,
    /// TODO
    failedCreation = 4,
}

/// TODO
enum ErrorFilter : uint {
    /// TODO
    validation = 1,
    /// TODO
    outOfMemory = 2,
    /// TODO
    internal = 3,
}

/// TODO
enum ErrorType : uint {
    /// TODO
    noError = 1,
    /// TODO
    validation = 2,
    /// TODO
    outOfMemory = 3,
    /// TODO
    internal = 4,
    /// TODO
    unknown = 5,
}

/// See @ref WGPURequestAdapterOptions::featureLevel.
enum FeatureLevel : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// "Compatibility" profile which can be supported on OpenGL ES 3.1 and
    /// D3D11.
    compatibility = 1,
    /// "Core" profile which can be supported on Vulkan/Metal/D3D12 (at least).
    core = 2,
}

/// TODO
enum FeatureName : uint {
    /// TODO
    coreFeaturesAndLimits = 1,
    /// TODO
    depthClipControl = 2,
    /// TODO
    depth32FloatStencil8 = 3,
    /// TODO
    textureCompressionBC = 4,
    /// TODO
    textureCompressionBCSliced3D = 5,
    /// TODO
    textureCompressionETC2 = 6,
    /// TODO
    textureCompressionASTC = 7,
    /// TODO
    textureCompressionASTCSliced3D = 8,
    /// TODO
    timestampQuery = 9,
    /// TODO
    indirectFirstInstance = 10,
    /// TODO
    shaderF16 = 11,
    /// TODO
    RG11B10UfloatRenderable = 12,
    /// TODO
    BGRA8UnormStorage = 13,
    /// TODO
    float32Filterable = 14,
    /// TODO
    float32Blendable = 15,
    /// TODO
    clipDistances = 16,
    /// TODO
    dualSourceBlending = 17,
    /// TODO
    subgroups = 18,
    /// TODO
    textureFormatsTier1 = 19,
    /// TODO
    textureFormatsTier2 = 20,
    /// TODO
    primitiveIndex = 21,
    /// TODO
    textureComponentSwizzle = 22,
}

/// TODO
enum FilterMode : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    nearest = 1,
    /// TODO
    linear = 2,
}

/// TODO
enum FrontFace : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    CCW = 1,
    /// TODO
    CW = 2,
}

/// TODO
enum IndexFormat : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    uint16 = 1,
    /// TODO
    uint32 = 2,
}

/// TODO
enum InstanceFeatureName : uint {
    /// Enable use of ::wgpuInstanceWaitAny with `timeoutNS \u003e 0`.
    timedWaitAny = 1,
    /// Enable passing SPIR-V shaders to @ref wgpuDeviceCreateShaderModule, via
    /// @ref WGPUShaderSourceSPIRV.
    shaderSourceSPIRV = 2,
    /// Normally, a @ref WGPUAdapter can only create a single device. If this is
    /// available and enabled, then adapters won't immediately expire when they
    /// create a device, so can be reused to make multiple devices. They may
    /// still expire for other reasons.
    multipleDevicesPerAdapter = 3,
}

/// TODO
enum LoadOp : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    load = 1,
    /// TODO
    clear = 2,
}

/// TODO
enum MapAsyncStatus : uint {
    /// TODO
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
    /// TODO
    error = 3,
    /// TODO
    aborted = 4,
}

/// TODO
enum MipmapFilterMode : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    nearest = 1,
    /// TODO
    linear = 2,
}

/// TODO
enum OptionalBool : uint {
    /// TODO
    false_ = 0,
    /// TODO
    true_ = 1,
    /// TODO
    undefined = 2,
}

/// TODO
enum PopErrorScopeStatus : uint {
    /// The error scope stack was successfully popped and a result was reported.
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
    /// The error scope stack could not be popped, because it was empty.
    error = 3,
}

/// TODO
enum PowerPreference : uint {
    /// No preference. (See also @ref SentinelValues.)
    undefined = 0,
    /// TODO
    lowPower = 1,
    /// TODO
    highPerformance = 2,
}

/// TODO
enum PredefinedColorSpace : uint {
    /// TODO
    SRGB = 1,
    /// TODO
    displayP3 = 2,
}

/// Describes when and in which order frames are presented on the screen when
/// @ref wgpuSurfacePresent is called.
enum PresentMode : uint {
    /// Present mode is not specified. Use the default.
    undefined = 0,
    /// The presentation of the image to the user waits for the next vertical
    /// blanking period to update in a first-in, first-out manner. Tearing
    /// cannot be observed and frame-loop will be limited to the display's
    /// refresh rate. This is the only mode that's always available.
    fifo = 1,
    /// The presentation of the image to the user tries to wait for the next
    /// vertical blanking period but may decide to not wait if a frame is
    /// presented late. Tearing can sometimes be observed but late-frame don't
    /// produce a full-frame stutter in the presentation. This is still a
    /// first-in, first-out mechanism so a frame-loop will be limited to the
    /// display's refresh rate.
    fifoRelaxed = 2,
    /// The presentation of the image to the user is updated immediately without
    /// waiting for a vertical blank. Tearing can be observed but latency is
    /// minimized.
    immediate = 3,
    /// The presentation of the image to the user waits for the next vertical
    /// blanking period to update to the latest provided image. Tearing cannot
    /// be observed and a frame-loop is not limited to the display's refresh
    /// rate.
    mailbox = 4,
}

/// TODO
enum PrimitiveTopology : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    pointList = 1,
    /// TODO
    lineList = 2,
    /// TODO
    lineStrip = 3,
    /// TODO
    triangleList = 4,
    /// TODO
    triangleStrip = 5,
}

/// TODO
enum QueryType : uint {
    /// TODO
    occlusion = 1,
    /// TODO
    timestamp = 2,
}

/// TODO
enum QueueWorkDoneStatus : uint {
    /// TODO
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
    /// There was some deterministic error. (Note this is currently never used,
    /// but it will be relevant when it's possible to create a queue object.)
    error = 3,
}

/// TODO
enum RequestAdapterStatus : uint {
    /// TODO
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
    /// TODO
    unavailable = 3,
    /// TODO
    error = 4,
}

/// TODO
enum RequestDeviceStatus : uint {
    /// TODO
    success = 1,
    /// See @ref CallbackStatuses.
    callbackCancelled = 2,
    /// TODO
    error = 3,
}

/// TODO
enum SType : uint {
    /// TODO
    shaderSourceSPIRV = 1,
    /// TODO
    shaderSourceWGSL = 2,
    /// TODO
    renderPassMaxDrawCount = 3,
    /// TODO
    surfaceSourceMetalLayer = 4,
    /// TODO
    surfaceSourceWindowsHWND = 5,
    /// TODO
    surfaceSourceXlibWindow = 6,
    /// TODO
    surfaceSourceWaylandSurface = 7,
    /// TODO
    surfaceSourceAndroidNativeWindow = 8,
    /// TODO
    surfaceSourceXCBWindow = 9,
    /// TODO
    surfaceColorManagement = 10,
    /// TODO
    requestAdapterWebXROptions = 11,
    /// TODO
    textureComponentSwizzleDescriptor = 12,
    /// TODO
    externalTextureBindingLayout = 13,
    /// TODO
    externalTextureBindingEntry = 14,
    /// TODO
    compatibilityModeLimits = 15,
    /// TODO
    textureBindingViewDimension = 16,
}

/// TODO
enum SamplerBindingType : uint {
    /// Indicates that this @ref WGPUSamplerBindingLayout member of its parent
    /// @ref WGPUBindGroupLayoutEntry is not used. (See also @ref
    /// SentinelValues.)
    bindingNotUsed = 0,
    /// `1`. Indicates no value is passed for this argument. See @ref
    /// SentinelValues.
    undefined = 1,
    /// TODO
    filtering = 2,
    /// TODO
    nonFiltering = 3,
    /// TODO
    comparison = 4,
}

/// Status code returned (synchronously) from many operations. Generally
/// indicates an invalid input like an unknown enum value or @ref
/// OutStructChainError. Read the function's documentation for specific error
/// conditions.
enum Status : uint {
    /// 
    success = 1,
    /// 
    error = 2,
}

/// TODO
enum StencilOperation : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    keep = 1,
    /// TODO
    zero = 2,
    /// TODO
    replace = 3,
    /// TODO
    invert = 4,
    /// TODO
    incrementClamp = 5,
    /// TODO
    decrementClamp = 6,
    /// TODO
    incrementWrap = 7,
    /// TODO
    decrementWrap = 8,
}

/// TODO
enum StorageTextureAccess : uint {
    /// Indicates that this @ref WGPUStorageTextureBindingLayout member of its
    /// parent @ref WGPUBindGroupLayoutEntry is not used. (See also @ref
    /// SentinelValues.)
    bindingNotUsed = 0,
    /// `1`. Indicates no value is passed for this argument. See @ref
    /// SentinelValues.
    undefined = 1,
    /// TODO
    writeOnly = 2,
    /// TODO
    readOnly = 3,
    /// TODO
    readWrite = 4,
}

/// TODO
enum StoreOp : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    store = 1,
    /// TODO
    discard = 2,
}

/// The status enum for @ref wgpuSurfaceGetCurrentTexture.
enum SurfaceGetCurrentTextureStatus : uint {
    /// Yay! Everything is good and we can render this frame.
    successOptimal = 1,
    /// Still OK - the surface can present the frame, but in a suboptimal way.
    /// The surface may need reconfiguration.
    successSuboptimal = 2,
    /// Some operation timed out while trying to acquire the frame.
    timeout = 3,
    /// The surface is too different to be used, compared to when it was
    /// originally created.
    outdated = 4,
    /// The connection to whatever owns the surface was lost, or generally needs
    /// to be fully reinitialized.
    lost = 5,
    /// There was some deterministic error (for example, the surface is not
    /// configured, or there was an @ref OutStructChainError). Should produce
    /// @ref ImplementationDefinedLogging containing details.
    error = 6,
}

/// TODO
enum TextureAspect : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    all = 1,
    /// TODO
    stencilOnly = 2,
    /// TODO
    depthOnly = 3,
}

/// TODO
enum TextureDimension : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    _1D = 1,
    /// TODO
    _2D = 2,
    /// TODO
    _3D = 3,
}

/// TODO
enum TextureFormat : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    R8Unorm = 1,
    /// TODO
    R8Snorm = 2,
    /// TODO
    R8Uint = 3,
    /// TODO
    R8Sint = 4,
    /// TODO
    R16Unorm = 5,
    /// TODO
    R16Snorm = 6,
    /// TODO
    R16Uint = 7,
    /// TODO
    R16Sint = 8,
    /// TODO
    R16Float = 9,
    /// TODO
    RG8Unorm = 10,
    /// TODO
    RG8Snorm = 11,
    /// TODO
    RG8Uint = 12,
    /// TODO
    RG8Sint = 13,
    /// TODO
    R32Float = 14,
    /// TODO
    R32Uint = 15,
    /// TODO
    R32Sint = 16,
    /// TODO
    RG16Unorm = 17,
    /// TODO
    RG16Snorm = 18,
    /// TODO
    RG16Uint = 19,
    /// TODO
    RG16Sint = 20,
    /// TODO
    RG16Float = 21,
    /// TODO
    RGBA8Unorm = 22,
    /// TODO
    RGBA8UnormSrgb = 23,
    /// TODO
    RGBA8Snorm = 24,
    /// TODO
    RGBA8Uint = 25,
    /// TODO
    RGBA8Sint = 26,
    /// TODO
    BGRA8Unorm = 27,
    /// TODO
    BGRA8UnormSrgb = 28,
    /// TODO
    RGB10A2Uint = 29,
    /// TODO
    RGB10A2Unorm = 30,
    /// TODO
    RG11B10Ufloat = 31,
    /// TODO
    RGB9E5Ufloat = 32,
    /// TODO
    RG32Float = 33,
    /// TODO
    RG32Uint = 34,
    /// TODO
    RG32Sint = 35,
    /// TODO
    RGBA16Unorm = 36,
    /// TODO
    RGBA16Snorm = 37,
    /// TODO
    RGBA16Uint = 38,
    /// TODO
    RGBA16Sint = 39,
    /// TODO
    RGBA16Float = 40,
    /// TODO
    RGBA32Float = 41,
    /// TODO
    RGBA32Uint = 42,
    /// TODO
    RGBA32Sint = 43,
    /// TODO
    stencil8 = 44,
    /// TODO
    depth16Unorm = 45,
    /// TODO
    depth24Plus = 46,
    /// TODO
    depth24PlusStencil8 = 47,
    /// TODO
    depth32Float = 48,
    /// TODO
    depth32FloatStencil8 = 49,
    /// TODO
    BC1RGBAUnorm = 50,
    /// TODO
    BC1RGBAUnormSrgb = 51,
    /// TODO
    BC2RGBAUnorm = 52,
    /// TODO
    BC2RGBAUnormSrgb = 53,
    /// TODO
    BC3RGBAUnorm = 54,
    /// TODO
    BC3RGBAUnormSrgb = 55,
    /// TODO
    BC4RUnorm = 56,
    /// TODO
    BC4RSnorm = 57,
    /// TODO
    BC5RGUnorm = 58,
    /// TODO
    BC5RGSnorm = 59,
    /// TODO
    BC6HRGBUfloat = 60,
    /// TODO
    BC6HRGBFloat = 61,
    /// TODO
    BC7RGBAUnorm = 62,
    /// TODO
    BC7RGBAUnormSrgb = 63,
    /// TODO
    ETC2RGB8Unorm = 64,
    /// TODO
    ETC2RGB8UnormSrgb = 65,
    /// TODO
    ETC2RGB8A1Unorm = 66,
    /// TODO
    ETC2RGB8A1UnormSrgb = 67,
    /// TODO
    ETC2RGBA8Unorm = 68,
    /// TODO
    ETC2RGBA8UnormSrgb = 69,
    /// TODO
    EACR11Unorm = 70,
    /// TODO
    EACR11Snorm = 71,
    /// TODO
    EACRG11Unorm = 72,
    /// TODO
    EACRG11Snorm = 73,
    /// TODO
    ASTC4x4Unorm = 74,
    /// TODO
    ASTC4x4UnormSrgb = 75,
    /// TODO
    ASTC5x4Unorm = 76,
    /// TODO
    ASTC5x4UnormSrgb = 77,
    /// TODO
    ASTC5x5Unorm = 78,
    /// TODO
    ASTC5x5UnormSrgb = 79,
    /// TODO
    ASTC6x5Unorm = 80,
    /// TODO
    ASTC6x5UnormSrgb = 81,
    /// TODO
    ASTC6x6Unorm = 82,
    /// TODO
    ASTC6x6UnormSrgb = 83,
    /// TODO
    ASTC8x5Unorm = 84,
    /// TODO
    ASTC8x5UnormSrgb = 85,
    /// TODO
    ASTC8x6Unorm = 86,
    /// TODO
    ASTC8x6UnormSrgb = 87,
    /// TODO
    ASTC8x8Unorm = 88,
    /// TODO
    ASTC8x8UnormSrgb = 89,
    /// TODO
    ASTC10x5Unorm = 90,
    /// TODO
    ASTC10x5UnormSrgb = 91,
    /// TODO
    ASTC10x6Unorm = 92,
    /// TODO
    ASTC10x6UnormSrgb = 93,
    /// TODO
    ASTC10x8Unorm = 94,
    /// TODO
    ASTC10x8UnormSrgb = 95,
    /// TODO
    ASTC10x10Unorm = 96,
    /// TODO
    ASTC10x10UnormSrgb = 97,
    /// TODO
    ASTC12x10Unorm = 98,
    /// TODO
    ASTC12x10UnormSrgb = 99,
    /// TODO
    ASTC12x12Unorm = 100,
    /// TODO
    ASTC12x12UnormSrgb = 101,
}

/// TODO
enum TextureSampleType : uint {
    /// Indicates that this @ref WGPUTextureBindingLayout member of its parent
    /// @ref WGPUBindGroupLayoutEntry is not used. (See also @ref
    /// SentinelValues.)
    bindingNotUsed = 0,
    /// `1`. Indicates no value is passed for this argument. See @ref
    /// SentinelValues.
    undefined = 1,
    /// TODO
    float_ = 2,
    /// TODO
    unfilterableFloat = 3,
    /// TODO
    depth = 4,
    /// TODO
    sint = 5,
    /// TODO
    uint_ = 6,
}

/// TODO
enum TextureViewDimension : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    _1D = 1,
    /// TODO
    _2D = 2,
    /// TODO
    _2DArray = 3,
    /// TODO
    cube = 4,
    /// TODO
    cubeArray = 5,
    /// TODO
    _3D = 6,
}

/// TODO
enum ToneMappingMode : uint {
    /// TODO
    standard = 1,
    /// TODO
    extended = 2,
}

/// TODO
enum VertexFormat : uint {
    /// TODO
    uint8 = 1,
    /// TODO
    uint8x2 = 2,
    /// TODO
    uint8x4 = 3,
    /// TODO
    sint8 = 4,
    /// TODO
    sint8x2 = 5,
    /// TODO
    sint8x4 = 6,
    /// TODO
    unorm8 = 7,
    /// TODO
    unorm8x2 = 8,
    /// TODO
    unorm8x4 = 9,
    /// TODO
    snorm8 = 10,
    /// TODO
    snorm8x2 = 11,
    /// TODO
    snorm8x4 = 12,
    /// TODO
    uint16 = 13,
    /// TODO
    uint16x2 = 14,
    /// TODO
    uint16x4 = 15,
    /// TODO
    sint16 = 16,
    /// TODO
    sint16x2 = 17,
    /// TODO
    sint16x4 = 18,
    /// TODO
    unorm16 = 19,
    /// TODO
    unorm16x2 = 20,
    /// TODO
    unorm16x4 = 21,
    /// TODO
    snorm16 = 22,
    /// TODO
    snorm16x2 = 23,
    /// TODO
    snorm16x4 = 24,
    /// TODO
    float16 = 25,
    /// TODO
    float16x2 = 26,
    /// TODO
    float16x4 = 27,
    /// TODO
    float32 = 28,
    /// TODO
    float32x2 = 29,
    /// TODO
    float32x3 = 30,
    /// TODO
    float32x4 = 31,
    /// TODO
    uint32 = 32,
    /// TODO
    uint32x2 = 33,
    /// TODO
    uint32x3 = 34,
    /// TODO
    uint32x4 = 35,
    /// TODO
    sint32 = 36,
    /// TODO
    sint32x2 = 37,
    /// TODO
    sint32x3 = 38,
    /// TODO
    sint32x4 = 39,
    /// TODO
    unorm1010102 = 40,
    /// TODO
    unorm8x4BGRA = 41,
}

/// TODO
enum VertexStepMode : uint {
    /// Indicates no value is passed for this argument. See @ref SentinelValues.
    undefined = 0,
    /// TODO
    vertex = 1,
    /// TODO
    instance = 2,
}

/// Status returned from a call to ::wgpuInstanceWaitAny.
enum WaitStatus : uint {
    /// At least one WGPUFuture completed successfully.
    success = 1,
    /// The wait operation succeeded, but no WGPUFutures completed within the
    /// timeout.
    timedOut = 2,
    /// The call was invalid for some reason (see @ref Wait-Any). Should produce
    /// @ref ImplementationDefinedLogging containing details.
    error = 3,
}

/// TODO
enum WGSLLanguageFeatureName : uint {
    /// TODO
    readonlyAndReadwriteStorageTextures = 1,
    /// TODO
    packed4x8IntegerDotProduct = 2,
    /// TODO
    unrestrictedPointerParameters = 3,
    /// TODO
    pointerCompositeAccess = 4,
    /// TODO
    uniformBufferStandardLayout = 5,
    /// TODO
    subgroupId = 6,
    /// TODO
    textureAndSamplerLet = 7,
    /// TODO
    subgroupUniformity = 8,
    /// TODO
    textureFormatsTier1 = 9,
    /// TODO
    linearIndexing = 10,
}


/// TODO
struct BufferUsage {
    mixin BitFlags!();

    /// TODO
    enum none = typeof(this).init;
    /// The buffer can be *mapped* on the CPU side in *read* mode (using @ref
    /// WGPUMapMode_Read).
    enum mapRead = typeof(this)[0];
    /// The buffer can be *mapped* on the CPU side in *write* mode (using @ref
    /// WGPUMapMode_Write). @note This usage is **not** required to set
    /// `mappedAtCreation` to `true` in @ref WGPUBufferDescriptor.
    enum mapWrite = typeof(this)[1];
    /// The buffer can be used as the *source* of a GPU-side copy operation.
    enum copySrc = typeof(this)[2];
    /// The buffer can be used as the *destination* of a GPU-side copy
    /// operation.
    enum copyDst = typeof(this)[3];
    /// The buffer can be used as an Index buffer when doing indexed drawing in
    /// a render pipeline.
    enum index = typeof(this)[4];
    /// The buffer can be used as a Vertex buffer when using a render pipeline.
    enum vertex = typeof(this)[5];
    /// The buffer can be bound to a shader as a uniform buffer.
    enum uniform = typeof(this)[6];
    /// The buffer can be bound to a shader as a storage buffer.
    enum storage = typeof(this)[7];
    /// The buffer can store arguments for an indirect draw call.
    enum indirect = typeof(this)[8];
    /// The buffer can store the result of a timestamp or occlusion query.
    enum queryResolve = typeof(this)[9];
}

/// TODO
struct ColorWriteMask {
    mixin BitFlags!();

    /// TODO
    enum none = typeof(this).init;
    /// TODO
    enum red = typeof(this)[0];
    /// TODO
    enum green = typeof(this)[1];
    /// TODO
    enum blue = typeof(this)[2];
    /// TODO
    enum alpha = typeof(this)[3];
    /// TODO
    enum all = red | green | blue | alpha;
}

/// TODO
struct MapMode {
    mixin BitFlags!();

    /// TODO
    enum none = typeof(this).init;
    /// TODO
    enum read = typeof(this)[0];
    /// TODO
    enum write = typeof(this)[1];
}

/// TODO
struct ShaderStage {
    mixin BitFlags!();

    /// TODO
    enum none = typeof(this).init;
    /// TODO
    enum vertex = typeof(this)[0];
    /// TODO
    enum fragment = typeof(this)[1];
    /// TODO
    enum compute = typeof(this)[2];
}

/// TODO
struct TextureUsage {
    mixin BitFlags!();

    /// TODO
    enum none = typeof(this).init;
    /// TODO
    enum copySrc = typeof(this)[0];
    /// TODO
    enum copyDst = typeof(this)[1];
    /// TODO
    enum textureBinding = typeof(this)[2];
    /// TODO
    enum storageBinding = typeof(this)[3];
    /// TODO
    enum renderAttachment = typeof(this)[4];
    /// TODO
    enum transientAttachment = typeof(this)[5];
}


struct BufferMapCallback {}
struct CompilationInfoCallback {}
struct CreateComputePipelineAsyncCallback {}
struct CreateRenderPipelineAsyncCallback {}
struct DeviceLostCallback {}
struct PopErrorScopeCallback {}
struct QueueWorkDoneCallback {}
struct RequestAdapterCallback {}
struct RequestDeviceCallback {}
struct UncapturedErrorCallback {}

void createInstance() {}
void getInstanceFeatures() {}
void getInstanceLimits() {}
void hasInstanceFeature() {}

/// TODO
struct AdapterInfo {
    /// TODO
    StringView vendor = StringView.init;
    /// TODO
    StringView architecture = StringView.init;
    /// TODO
    StringView device = StringView.init;
    /// TODO
    StringView description = StringView.init;
    /// TODO
    BackendType backendType = BackendType.undefined;
    /// TODO
    AdapterType adapterType = cast(AdapterType)0;
    /// TODO
    uint vendorID = 0;
    /// TODO
    uint deviceID = 0;
    /// TODO
    uint subgroupMinSize = 0;
    /// TODO
    uint subgroupMaxSize = 0;
}

/// TODO
struct BindGroupDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    BindGroupLayout.Handle layout = BindGroupLayout.Handle.init;
    /// TODO
    const(BindGroupEntry)[] entries = null;
}

/// TODO
struct BindGroupEntry {
    /// Binding index in the bind group.
    uint binding = 0;
    /// Set this if the binding is a buffer object. Otherwise must be null.
    Buffer.Handle buffer = Buffer.Handle.init;
    /// If the binding is a buffer, this is the byte offset of the binding
    /// range. Otherwise ignored.
    ulong offset = 0;
    /// If the binding is a buffer, this is the byte size of the binding range
    /// (@ref WGPU_WHOLE_SIZE means the binding ends at the end of the buffer).
    /// Otherwise ignored.
    ulong size = WHOLE_SIZE;
    /// Set this if the binding is a sampler object. Otherwise must be null.
    Sampler.Handle sampler = Sampler.Handle.init;
    /// Set this if the binding is a texture view object. Otherwise must be
    /// null.
    TextureView.Handle textureView = TextureView.Handle.init;
}

/// TODO
struct BindGroupLayoutDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    const(BindGroupLayoutEntry)[] entries = null;
}

/// TODO
struct BindGroupLayoutEntry {
    /// TODO
    uint binding = 0;
    /// TODO
    ShaderStage visibility = ShaderStage.none;
    /// If non-zero, this entry defines a binding array with this size.
    uint bindingArraySize = 0;
    /// TODO
    BufferBindingLayout buffer = ZeroInit!BufferBindingLayout;
    /// TODO
    SamplerBindingLayout sampler = ZeroInit!SamplerBindingLayout;
    /// TODO
    TextureBindingLayout texture = ZeroInit!TextureBindingLayout;
    /// TODO
    StorageTextureBindingLayout storageTexture = ZeroInit!StorageTextureBindingLayout;
}

/// TODO
struct BlendComponent {
    /// If set to @ref WGPUBlendOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBlendOperation_Add.
    BlendOperation operation = BlendOperation.undefined;
    /// If set to @ref WGPUBlendFactor_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBlendFactor_One.
    BlendFactor srcFactor = BlendFactor.undefined;
    /// If set to @ref WGPUBlendFactor_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBlendFactor_Zero.
    BlendFactor dstFactor = BlendFactor.undefined;
}

/// TODO
struct BlendState {
    /// TODO
    BlendComponent color = BlendComponent.init;
    /// TODO
    BlendComponent alpha = BlendComponent.init;
}

/// TODO
struct BufferBindingLayout {
    /// If set to @ref WGPUBufferBindingType_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBufferBindingType_Uniform.
    BufferBindingType type = BufferBindingType.undefined;
    /// TODO
    bool hasDynamicOffset = false;
    /// TODO
    ulong minBindingSize = 0;
}

/// TODO
struct BufferDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    BufferUsage usage = BufferUsage.none;
    /// TODO
    ulong size = 0;
    /// When true, the buffer is mapped in write mode at creation. It should
    /// thus be unmapped once its initial data has been written. @note Mapping
    /// at creation does **not** require the usage @ref
    /// WGPUBufferUsage_MapWrite.
    bool mappedAtCreation = false;
}

/// An RGBA color. Represents a `f32`, `i32`, or `u32` color using @ref
/// DoubleAsSupertype. If any channel is non-finite, produces a @ref
/// NonFiniteFloatValueError.
struct Color {
    /// 
    double r = 0.0;
    /// 
    double g = 0.0;
    /// 
    double b = 0.0;
    /// 
    double a = 0.0;
}

/// TODO
struct ColorTargetState {
    /// The texture format of the target. If @ref WGPUTextureFormat_Undefined,
    /// indicates a "hole" in the parent @ref WGPUFragmentState `targets` array:
    /// the pipeline does not output a value at this `location`.
    TextureFormat format = TextureFormat.undefined;
    /// TODO
    const(BlendState)* blend = null;
    /// TODO
    ColorWriteMask writeMask = ColorWriteMask.all;
}

/// TODO
struct CommandBufferDescriptor {
    /// TODO
    StringView label = StringView.init;
}

/// TODO
struct CommandEncoderDescriptor {
    /// TODO
    StringView label = StringView.init;
}

/// Note: While Compatibility Mode is optional to implement, this extension
/// struct is required to be supported (for both queries and requests) and
/// behave as defined in the WebGPU spec.
struct CompatibilityModeLimits {
    /// TODO
    uint maxStorageBuffersInVertexStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxStorageTexturesInVertexStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxStorageBuffersInFragmentStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxStorageTexturesInFragmentStage = LIMIT_U32_UNDEFINED;
}

/// TODO
struct CompilationInfo {
    /// TODO
    const(CompilationMessage)[] messages = null;
}

/// TODO
struct CompilationMessage {
    /// A @ref LocalizableHumanReadableMessageString.
    StringView message = StringView.init;
    /// Severity level of the message.
    CompilationMessageType type = cast(CompilationMessageType)0;
    /// Line number where the message is attached, starting at 1.
    ulong lineNum = 0;
    /// Offset in UTF-8 code units (bytes) from the beginning of the line,
    /// starting at 1.
    ulong linePos = 0;
    /// Offset in UTF-8 code units (bytes) from the beginning of the shader
    /// code, starting at 0.
    ulong offset = 0;
    /// Length in UTF-8 code units (bytes) of the span the message corresponds
    /// to.
    ulong length = 0;
}

/// TODO
struct ComputePassDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    const(PassTimestampWrites)* timestampWrites = null;
}

/// TODO
struct ComputePipelineDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    PipelineLayout.Handle layout = PipelineLayout.Handle.init;
    /// TODO
    ComputeState compute = ComputeState.init;
}

/// TODO
struct ComputeState {
    /// TODO
    ShaderModule.Handle module_ = ShaderModule.Handle.init;
    /// TODO
    StringView entryPoint = StringView.init;
    /// TODO
    const(ConstantEntry)[] constants = null;
}

/// TODO
struct ConstantEntry {
    /// TODO
    StringView key = StringView.init;
    /// Represents a WGSL numeric or boolean value using @ref DoubleAsSupertype.
    /// If non-finite, produces a @ref NonFiniteFloatValueError.
    double value = 0.0;
}

/// TODO
struct DepthStencilState {
    /// TODO
    TextureFormat format = TextureFormat.undefined;
    /// TODO
    OptionalBool depthWriteEnabled = OptionalBool.undefined;
    /// TODO
    CompareFunction depthCompare = CompareFunction.undefined;
    /// TODO
    StencilFaceState stencilFront = StencilFaceState.init;
    /// TODO
    StencilFaceState stencilBack = StencilFaceState.init;
    /// TODO
    uint stencilReadMask = 0xFFFFFFFF;
    /// TODO
    uint stencilWriteMask = 0xFFFFFFFF;
    /// TODO
    int depthBias = 0;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float depthBiasSlopeScale = 0.0f;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float depthBiasClamp = 0.0f;
}

/// TODO
struct DeviceDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    const(FeatureName)[] requiredFeatures = null;
    /// TODO
    const(Limits)* requiredLimits = null;
    /// TODO
    QueueDescriptor defaultQueue = QueueDescriptor.init;
    /// TODO
    DeviceLostCallback deviceLostCallbackInfo = DeviceLostCallback.init;
    /// Called when there is an uncaptured error on this device, from any
    /// thread. See @ref ErrorScopes. **Important:** This callback does not have
    /// a configurable @ref WGPUCallbackMode; it may be called at any time (like
    /// @ref WGPUCallbackMode_AllowSpontaneous). As such, calls into the
    /// `webgpu.h` API from this callback are unsafe. See @ref
    /// CallbackReentrancy.
    UncapturedErrorCallback uncapturedErrorCallbackInfo = UncapturedErrorCallback.init;
}

/// TODO
struct Extent3D {
    /// TODO
    uint width = 0;
    /// TODO
    uint height = 1;
    /// TODO
    uint depthOrArrayLayers = 1;
}

/// Chained in an @ref WGPUBindGroupEntry to set it to an @ref
/// WGPUExternalTexture. This must have a corresponding @ref
/// WGPUExternalTextureBindingLayout in the @ref WGPUBindGroupLayout.
struct ExternalTextureBindingEntry {
    /// TODO
    ExternalTexture.Handle externalTexture = ExternalTexture.Handle.init;
}

/// Chained in @ref WGPUBindGroupLayoutEntry to specify that the corresponding
/// entries in an @ref WGPUBindGroup will contain an @ref WGPUExternalTexture.
struct ExternalTextureBindingLayout {
}

/// TODO
struct FragmentState {
    /// TODO
    ShaderModule.Handle module_ = ShaderModule.Handle.init;
    /// TODO
    StringView entryPoint = StringView.init;
    /// TODO
    const(ConstantEntry)[] constants = null;
    /// TODO
    const(ColorTargetState)[] targets = null;
}

/// Opaque handle to an asynchronous operation. See @ref Asynchronous-Operations
/// for more information.
struct Future {
    /// Opaque id of the @ref WGPUFuture
    ulong id = 0;
}

/// Struct holding a future to wait on, and a `completed` boolean flag.
struct FutureWaitInfo {
    /// The future to wait on.
    Future future = Future.init;
    /// Whether or not the future completed.
    bool completed = false;
}

/// TODO
struct InstanceDescriptor {
    /// TODO
    const(InstanceFeatureName)[] requiredFeatures = null;
    /// TODO
    const(InstanceLimits)* requiredLimits = null;
}

/// TODO
struct InstanceLimits {
    /// The maximum number @ref WGPUFutureWaitInfo supported in a call to
    /// ::wgpuInstanceWaitAny with `timeoutNS \u003e 0`.
    size_t timedWaitAnyMaxCount = 0;
}

/// TODO
struct Limits {
    /// TODO
    uint maxTextureDimension1D = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxTextureDimension2D = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxTextureDimension3D = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxTextureArrayLayers = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxBindGroups = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxBindGroupsPlusVertexBuffers = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxBindingsPerBindGroup = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxDynamicUniformBuffersPerPipelineLayout = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxDynamicStorageBuffersPerPipelineLayout = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxSampledTexturesPerShaderStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxSamplersPerShaderStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxStorageBuffersPerShaderStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxStorageTexturesPerShaderStage = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxUniformBuffersPerShaderStage = LIMIT_U32_UNDEFINED;
    /// TODO
    ulong maxUniformBufferBindingSize = LIMIT_U64_UNDEFINED;
    /// TODO
    ulong maxStorageBufferBindingSize = LIMIT_U64_UNDEFINED;
    /// TODO
    uint minUniformBufferOffsetAlignment = LIMIT_U32_UNDEFINED;
    /// TODO
    uint minStorageBufferOffsetAlignment = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxVertexBuffers = LIMIT_U32_UNDEFINED;
    /// TODO
    ulong maxBufferSize = LIMIT_U64_UNDEFINED;
    /// TODO
    uint maxVertexAttributes = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxVertexBufferArrayStride = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxInterStageShaderVariables = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxColorAttachments = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxColorAttachmentBytesPerSample = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxComputeWorkgroupStorageSize = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxComputeInvocationsPerWorkgroup = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxComputeWorkgroupSizeX = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxComputeWorkgroupSizeY = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxComputeWorkgroupSizeZ = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxComputeWorkgroupsPerDimension = LIMIT_U32_UNDEFINED;
    /// TODO
    uint maxImmediateSize = LIMIT_U32_UNDEFINED;
}

/// TODO
struct MultisampleState {
    /// TODO
    uint count = 1;
    /// TODO
    uint mask = 0xFFFFFFFF;
    /// TODO
    bool alphaToCoverageEnabled = false;
}

/// TODO
struct Origin3D {
    /// TODO
    uint x = 0;
    /// TODO
    uint y = 0;
    /// TODO
    uint z = 0;
}

/// TODO
struct PassTimestampWrites {
    /// Query set to write timestamps to.
    QuerySet.Handle querySet = QuerySet.Handle.init;
    /// TODO
    uint beginningOfPassWriteIndex = QUERY_SET_INDEX_UNDEFINED;
    /// TODO
    uint endOfPassWriteIndex = QUERY_SET_INDEX_UNDEFINED;
}

/// TODO
struct PipelineLayoutDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    const(BindGroupLayout.Handle)[] bindGroupLayouts = null;
    /// TODO
    uint immediateSize = 0;
}

/// TODO
struct PrimitiveState {
    /// If set to @ref WGPUPrimitiveTopology_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUPrimitiveTopology_TriangleList.
    PrimitiveTopology topology = PrimitiveTopology.undefined;
    /// TODO
    IndexFormat stripIndexFormat = IndexFormat.undefined;
    /// If set to @ref WGPUFrontFace_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFrontFace_CCW.
    FrontFace frontFace = FrontFace.undefined;
    /// If set to @ref WGPUCullMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUCullMode_None.
    CullMode cullMode = CullMode.undefined;
    /// TODO
    bool unclippedDepth = false;
}

/// TODO
struct QuerySetDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    QueryType type = cast(QueryType)0;
    /// TODO
    uint count = 0;
}

/// TODO
struct QueueDescriptor {
    /// TODO
    StringView label = StringView.init;
}

/// TODO
struct RenderBundleDescriptor {
    /// TODO
    StringView label = StringView.init;
}

/// TODO
struct RenderBundleEncoderDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    const(TextureFormat)[] colorFormats = null;
    /// TODO
    TextureFormat depthStencilFormat = TextureFormat.undefined;
    /// TODO
    uint sampleCount = 1;
    /// TODO
    bool depthReadOnly = false;
    /// TODO
    bool stencilReadOnly = false;
}

/// TODO
struct RenderPassColorAttachment {
    /// If `NULL`, indicates a hole in the parent @ref
    /// WGPURenderPassDescriptor::colorAttachments array.
    TextureView.Handle view = TextureView.Handle.init;
    /// TODO
    uint depthSlice = DEPTH_SLICE_UNDEFINED;
    /// TODO
    TextureView.Handle resolveTarget = TextureView.Handle.init;
    /// TODO
    LoadOp loadOp = LoadOp.undefined;
    /// TODO
    StoreOp storeOp = StoreOp.undefined;
    /// TODO
    Color clearValue = Color.init;
}

/// TODO
struct RenderPassDepthStencilAttachment {
    /// TODO
    TextureView.Handle view = TextureView.Handle.init;
    /// TODO
    LoadOp depthLoadOp = LoadOp.undefined;
    /// TODO
    StoreOp depthStoreOp = StoreOp.undefined;
    /// This is a @ref NullableFloatingPointType. If `NaN`, indicates an
    /// `undefined` value (as defined by the JS spec). Use @ref
    /// WGPU_DEPTH_CLEAR_VALUE_UNDEFINED to indicate this semantically. If
    /// infinite, produces a @ref NonFiniteFloatValueError.
    float depthClearValue = DEPTH_CLEAR_VALUE_UNDEFINED;
    /// TODO
    bool depthReadOnly = false;
    /// TODO
    LoadOp stencilLoadOp = LoadOp.undefined;
    /// TODO
    StoreOp stencilStoreOp = StoreOp.undefined;
    /// TODO
    uint stencilClearValue = 0;
    /// TODO
    bool stencilReadOnly = false;
}

/// TODO
struct RenderPassDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    const(RenderPassColorAttachment)[] colorAttachments = null;
    /// TODO
    const(RenderPassDepthStencilAttachment)* depthStencilAttachment = null;
    /// TODO
    QuerySet.Handle occlusionQuerySet = QuerySet.Handle.init;
    /// TODO
    const(PassTimestampWrites)* timestampWrites = null;
}

/// TODO
struct RenderPassMaxDrawCount {
    /// TODO
    ulong maxDrawCount = 50000000;
}

/// TODO
struct RenderPipelineDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    PipelineLayout.Handle layout = PipelineLayout.Handle.init;
    /// TODO
    VertexState vertex = VertexState.init;
    /// TODO
    PrimitiveState primitive = PrimitiveState.init;
    /// TODO
    const(DepthStencilState)* depthStencil = null;
    /// TODO
    MultisampleState multisample = MultisampleState.init;
    /// TODO
    const(FragmentState)* fragment = null;
}

/// TODO
struct RequestAdapterOptions {
    /// "Feature level" for the adapter request. If an adapter is returned, it
    /// must support the features and limits in the requested feature level. If
    /// set to @ref WGPUFeatureLevel_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFeatureLevel_Core. Additionally, implementations may ignore
    /// @ref WGPUFeatureLevel_Compatibility and provide @ref
    /// WGPUFeatureLevel_Core instead.
    FeatureLevel featureLevel = FeatureLevel.undefined;
    /// TODO
    PowerPreference powerPreference = PowerPreference.undefined;
    /// If true, requires the adapter to be a "fallback" adapter as defined by
    /// the JS spec. If this is not possible, the request returns null.
    bool forceFallbackAdapter = false;
    /// If set, requires the adapter to have a particular backend type. If this
    /// is not possible, the request returns null.
    BackendType backendType = BackendType.undefined;
    /// If set, requires the adapter to be able to output to a particular
    /// surface. If this is not possible, the request returns null.
    Surface.Handle compatibleSurface = Surface.Handle.init;
}

/// Extension providing requestAdapter options for implementations with WebXR
/// interop (i.e. Wasm).
struct RequestAdapterWebXROptions {
    /// Sets the `xrCompatible` option in the JS API.
    bool xrCompatible = false;
}

/// TODO
struct SamplerBindingLayout {
    /// If set to @ref WGPUSamplerBindingType_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUSamplerBindingType_Filtering.
    SamplerBindingType type = SamplerBindingType.undefined;
}

/// TODO
struct SamplerDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// If set to @ref WGPUAddressMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUAddressMode_ClampToEdge.
    AddressMode addressModeU = AddressMode.undefined;
    /// If set to @ref WGPUAddressMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUAddressMode_ClampToEdge.
    AddressMode addressModeV = AddressMode.undefined;
    /// If set to @ref WGPUAddressMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUAddressMode_ClampToEdge.
    AddressMode addressModeW = AddressMode.undefined;
    /// If set to @ref WGPUFilterMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFilterMode_Nearest.
    FilterMode magFilter = FilterMode.undefined;
    /// If set to @ref WGPUFilterMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFilterMode_Nearest.
    FilterMode minFilter = FilterMode.undefined;
    /// If set to @ref WGPUFilterMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUMipmapFilterMode_Nearest.
    MipmapFilterMode mipmapFilter = MipmapFilterMode.undefined;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float lodMinClamp = 0.0f;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float lodMaxClamp = 32.0f;
    /// TODO
    CompareFunction compare = CompareFunction.undefined;
    /// TODO
    ushort maxAnisotropy = 1;
}

/// TODO
struct ShaderModuleDescriptor {
    /// TODO
    StringView label = StringView.init;
}

/// TODO
struct ShaderSourceSPIRV {
    /// TODO
    uint codeSize = 0;
    /// TODO
    const(uint)* code = null;
}

/// TODO
struct ShaderSourceWGSL {
    /// TODO
    StringView code = StringView.init;
}

/// TODO
struct StencilFaceState {
    /// If set to @ref WGPUCompareFunction_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUCompareFunction_Always.
    CompareFunction compare = CompareFunction.undefined;
    /// If set to @ref WGPUStencilOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStencilOperation_Keep.
    StencilOperation failOp = StencilOperation.undefined;
    /// If set to @ref WGPUStencilOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStencilOperation_Keep.
    StencilOperation depthFailOp = StencilOperation.undefined;
    /// If set to @ref WGPUStencilOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStencilOperation_Keep.
    StencilOperation passOp = StencilOperation.undefined;
}

/// TODO
struct StorageTextureBindingLayout {
    /// If set to @ref WGPUStorageTextureAccess_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStorageTextureAccess_WriteOnly.
    StorageTextureAccess access = StorageTextureAccess.undefined;
    /// TODO
    TextureFormat format = TextureFormat.undefined;
    /// If set to @ref WGPUTextureViewDimension_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureViewDimension_2D.
    TextureViewDimension viewDimension = TextureViewDimension.undefined;
}

/// TODO
struct SupportedFeatures {
    /// TODO
    const(FeatureName)[] features = null;
}

/// TODO
struct SupportedInstanceFeatures {
    /// TODO
    const(InstanceFeatureName)[] features = null;
}

/// TODO
struct SupportedWGSLLanguageFeatures {
    /// TODO
    const(WGSLLanguageFeatureName)[] features = null;
}

/// Filled by @ref wgpuSurfaceGetCapabilities with what's supported for @ref
/// wgpuSurfaceConfigure for a pair of @ref WGPUSurface and @ref WGPUAdapter.
struct SurfaceCapabilities {
    /// The bit set of supported @ref WGPUTextureUsage bits. Guaranteed to
    /// contain @ref WGPUTextureUsage_RenderAttachment.
    TextureUsage usages = TextureUsage.none;
    /// A list of supported @ref WGPUTextureFormat values, in order of
    /// preference.
    const(TextureFormat)[] formats = null;
    /// A list of supported @ref WGPUPresentMode values. Guaranteed to contain
    /// @ref WGPUPresentMode_Fifo.
    const(PresentMode)[] presentModes = null;
    /// A list of supported @ref WGPUCompositeAlphaMode values. @ref
    /// WGPUCompositeAlphaMode_Auto will be an alias for the first element and
    /// will never be present in this array.
    const(CompositeAlphaMode)[] alphaModes = null;
}

/// Extension of @ref WGPUSurfaceConfiguration for color spaces and HDR.
struct SurfaceColorManagement {
    /// TODO
    PredefinedColorSpace colorSpace = cast(PredefinedColorSpace)0;
    /// TODO
    ToneMappingMode toneMappingMode = cast(ToneMappingMode)0;
}

/// Options to @ref wgpuSurfaceConfigure for defining how a @ref WGPUSurface
/// will be rendered to and presented to the user. See @ref
/// Surface-Configuration for more details.
struct SurfaceConfiguration {
    /// The @ref WGPUDevice to use to render to surface's textures.
    Device.Handle device = Device.Handle.init;
    /// The @ref WGPUTextureFormat of the surface's textures.
    TextureFormat format = TextureFormat.undefined;
    /// The @ref WGPUTextureUsage of the surface's textures.
    TextureUsage usage = TextureUsage.renderAttachment;
    /// The width of the surface's textures.
    uint width = 0;
    /// The height of the surface's textures.
    uint height = 0;
    /// The additional @ref WGPUTextureFormat for @ref WGPUTextureView format
    /// reinterpretation of the surface's textures.
    const(TextureFormat)[] viewFormats = null;
    /// How the surface's frames will be composited on the screen. If set to
    /// @ref WGPUCompositeAlphaMode_Auto, [defaults] to @ref
    /// WGPUCompositeAlphaMode_Inherit in native (allowing the mode to be
    /// configured externally), and to @ref WGPUCompositeAlphaMode_Opaque in
    /// Wasm.
    CompositeAlphaMode alphaMode = CompositeAlphaMode.auto_;
    /// When and in which order the surface's frames will be shown on the
    /// screen. If set to @ref WGPUPresentMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUPresentMode_Fifo.
    PresentMode presentMode = PresentMode.undefined;
}

/// The root descriptor for the creation of an @ref WGPUSurface with @ref
/// wgpuInstanceCreateSurface. It isn't sufficient by itself and must have one
/// of the `WGPUSurfaceSource*` in its chain. See @ref Surface-Creation for more
/// details.
struct SurfaceDescriptor {
    /// Label used to refer to the object.
    StringView label = StringView.init;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping
/// an Android
/// [`ANativeWindow`](https://developer.android.com/ndk/reference/group/a-native-window).
struct SurfaceSourceAndroidNativeWindow {
    /// The pointer to the
    /// [`ANativeWindow`](https://developer.android.com/ndk/reference/group/a-native-window)
    /// that will be wrapped by the @ref WGPUSurface.
    void* window = null;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a
/// [`CAMetalLayer`](https://developer.apple.com/documentation/quartzcore/cametallayer?language=objc).
struct SurfaceSourceMetalLayer {
    /// The pointer to the
    /// [`CAMetalLayer`](https://developer.apple.com/documentation/quartzcore/cametallayer?language=objc)
    /// that will be wrapped by the @ref WGPUSurface.
    void* layer = null;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a
/// [Wayland](https://wayland.freedesktop.org/)
/// [`wl_surface`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_surface).
struct SurfaceSourceWaylandSurface {
    /// A
    /// [`wl_display`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_display)
    /// for this Wayland instance.
    void* display = null;
    /// A
    /// [`wl_surface`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_surface)
    /// that will be wrapped by the @ref WGPUSurface
    void* surface = null;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a
/// Windows
/// [`HWND`](https://learn.microsoft.com/en-us/windows/apps/develop/ui-input/retrieve-hwnd).
struct SurfaceSourceWindowsHWND {
    /// The
    /// [`HINSTANCE`](https://learn.microsoft.com/en-us/windows/win32/learnwin32/winmain--the-application-entry-point)
    /// for this application. Most commonly `GetModuleHandle(nullptr)`.
    void* hinstance = null;
    /// The
    /// [`HWND`](https://learn.microsoft.com/en-us/windows/apps/develop/ui-input/retrieve-hwnd)
    /// that will be wrapped by the @ref WGPUSurface.
    void* hwnd = null;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping
/// an [XCB](https://xcb.freedesktop.org/) `xcb_window_t`.
struct SurfaceSourceXCBWindow {
    /// The `xcb_connection_t` for the connection to the X server.
    void* connection = null;
    /// The `xcb_window_t` for the window that will be wrapped by the @ref
    /// WGPUSurface.
    uint window = 0;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping
/// an [Xlib](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html)
/// `Window`.
struct SurfaceSourceXlibWindow {
    /// A pointer to the
    /// [`Display`](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html#Opening_the_Display)
    /// connected to the X server.
    void* display = null;
    /// The
    /// [`Window`](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html#Creating_Windows)
    /// that will be wrapped by the @ref WGPUSurface.
    ulong window = 0;
}

/// Queried each frame from a @ref WGPUSurface to get a @ref WGPUTexture to
/// render to along with some metadata. See @ref Surface-Presenting for more
/// details.
struct SurfaceTexture {
    /// The @ref WGPUTexture representing the frame that will be shown on the
    /// surface. It is @ref ReturnedWithOwnership from @ref
    /// wgpuSurfaceGetCurrentTexture.
    Texture.Handle texture = Texture.Handle.init;
    /// Whether the call to @ref wgpuSurfaceGetCurrentTexture succeeded and a
    /// hint as to why it might not have.
    SurfaceGetCurrentTextureStatus status = cast(SurfaceGetCurrentTextureStatus)0;
}

/// TODO
struct TexelCopyBufferInfo {
    /// TODO
    TexelCopyBufferLayout layout = TexelCopyBufferLayout.init;
    /// TODO
    Buffer.Handle buffer = Buffer.Handle.init;
}

/// TODO
struct TexelCopyBufferLayout {
    /// TODO
    ulong offset = 0;
    /// TODO
    uint bytesPerRow = COPY_STRIDE_UNDEFINED;
    /// TODO
    uint rowsPerImage = COPY_STRIDE_UNDEFINED;
}

/// TODO
struct TexelCopyTextureInfo {
    /// TODO
    Texture.Handle texture = Texture.Handle.init;
    /// TODO
    uint mipLevel = 0;
    /// TODO
    Origin3D origin = Origin3D.init;
    /// If set to @ref WGPUTextureAspect_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureAspect_All.
    TextureAspect aspect = TextureAspect.undefined;
}

/// TODO
struct TextureBindingLayout {
    /// If set to @ref WGPUTextureSampleType_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureSampleType_Float.
    TextureSampleType sampleType = TextureSampleType.undefined;
    /// If set to @ref WGPUTextureViewDimension_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureViewDimension_2D.
    TextureViewDimension viewDimension = TextureViewDimension.undefined;
    /// TODO
    bool multisampled = false;
}

/// Note: While Compatibility Mode is optional to implement, this extension
/// struct is required to be accepted (but per the WebGPU spec, its contents are
/// ignored on devices that have the @ref WGPUFeatureName_CoreFeaturesAndLimits
/// feature).
struct TextureBindingViewDimension {
    /// TODO
    TextureViewDimension textureBindingViewDimension = TextureViewDimension.undefined;
}

/// When accessed by a shader, the red/green/blue/alpha channels are replaced by
/// the value corresponding to the component specified in r, g, b, and a,
/// respectively unlike the JS API which uses a string of length four, with each
/// character mapping to the texture view's red/green/blue/alpha channels.
struct TextureComponentSwizzle {
    /// The value that replaces the red channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_R.
    ComponentSwizzle r = ComponentSwizzle.undefined;
    /// The value that replaces the green channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_G.
    ComponentSwizzle g = ComponentSwizzle.undefined;
    /// The value that replaces the blue channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_B.
    ComponentSwizzle b = ComponentSwizzle.undefined;
    /// The value that replaces the alpha channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_A.
    ComponentSwizzle a = ComponentSwizzle.undefined;
}

/// TODO
struct TextureComponentSwizzleDescriptor {
    /// TODO
    TextureComponentSwizzle swizzle = TextureComponentSwizzle.init;
}

/// TODO
struct TextureDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    TextureUsage usage = TextureUsage.none;
    /// If set to @ref WGPUTextureDimension_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureDimension_2D.
    TextureDimension dimension = TextureDimension.undefined;
    /// TODO
    Extent3D size = Extent3D.init;
    /// TODO
    TextureFormat format = TextureFormat.undefined;
    /// TODO
    uint mipLevelCount = 1;
    /// TODO
    uint sampleCount = 1;
    /// TODO
    const(TextureFormat)[] viewFormats = null;
}

/// TODO
struct TextureViewDescriptor {
    /// TODO
    StringView label = StringView.init;
    /// TODO
    TextureFormat format = TextureFormat.undefined;
    /// TODO
    TextureViewDimension dimension = TextureViewDimension.undefined;
    /// TODO
    uint baseMipLevel = 0;
    /// TODO
    uint mipLevelCount = MIP_LEVEL_COUNT_UNDEFINED;
    /// TODO
    uint baseArrayLayer = 0;
    /// TODO
    uint arrayLayerCount = ARRAY_LAYER_COUNT_UNDEFINED;
    /// If set to @ref WGPUTextureAspect_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureAspect_All.
    TextureAspect aspect = TextureAspect.undefined;
    /// TODO
    TextureUsage usage = TextureUsage.none;
}

/// TODO
struct VertexAttribute {
    /// TODO
    VertexFormat format = cast(VertexFormat)0;
    /// TODO
    ulong offset = 0;
    /// TODO
    uint shaderLocation = 0;
}

/// If `attributes` is empty *and* `stepMode` is @ref
/// WGPUVertexStepMode_Undefined, indicates a "hole" in the parent @ref
/// WGPUVertexState `buffers` array, with behavior equivalent to `null` in the
/// JS API. If `attributes` is empty but `stepMode` is *not* @ref
/// WGPUVertexStepMode_Undefined, indicates a vertex buffer with no attributes,
/// with behavior equivalent to `{ attributes: [] }` in the JS API. (TODO: If
/// the JS API changes not to distinguish these cases, then this distinction
/// doesn't matter and we can remove this documentation.) If `stepMode` is @ref
/// WGPUVertexStepMode_Undefined but `attributes` is *not* empty, `stepMode`
/// [defaults](@ref SentinelValues) to @ref WGPUVertexStepMode_Vertex.
struct VertexBufferLayout {
    /// TODO
    VertexStepMode stepMode = VertexStepMode.undefined;
    /// TODO
    ulong arrayStride = 0;
    /// TODO
    const(VertexAttribute)[] attributes = null;
}

/// TODO
struct VertexState {
    /// TODO
    ShaderModule.Handle module_ = ShaderModule.Handle.init;
    /// TODO
    StringView entryPoint = StringView.init;
    /// TODO
    const(ConstantEntry)[] constants = null;
    /// TODO
    const(VertexBufferLayout)[] buffers = null;
}


/// TODO
alias Adapter = WebGPUObject!"Adapter";

/// TODO
Status getLimits(scope Adapter.Handle self, scope ref Limits limits) @trusted nothrow @nogc {
    return wgpuAdapterGetLimits(self, &limits);
}
private extern(C) Status wgpuAdapterGetLimits(Adapter.Handle, Limits*) nothrow @nogc;

/// TODO
bool hasFeature(scope Adapter.Handle self, FeatureName feature) @trusted nothrow @nogc {
    return wgpuAdapterHasFeature(self, feature);
}
private extern(C) bool wgpuAdapterHasFeature(Adapter.Handle, FeatureName) nothrow @nogc;

/// Get the list of @ref WGPUFeatureName values supported by the adapter.
void getFeatures(scope Adapter.Handle self, scope ref SupportedFeatures features) @trusted nothrow @nogc {
    wgpuAdapterGetFeatures(self, &features);
}
private extern(C) void wgpuAdapterGetFeatures(Adapter.Handle, SupportedFeatures*) nothrow @nogc;

/// TODO
Status getInfo(scope Adapter.Handle self, scope ref AdapterInfo info) @trusted nothrow @nogc {
    return wgpuAdapterGetInfo(self, &info);
}
private extern(C) Status wgpuAdapterGetInfo(Adapter.Handle, AdapterInfo*) nothrow @nogc;

/// TODO
void requestDevice(scope Adapter.Handle self, scope ref const DeviceDescriptor descriptor) @trusted nothrow @nogc {
    wgpuAdapterRequestDevice(self, &descriptor);
}
private extern(C) void wgpuAdapterRequestDevice(Adapter.Handle, const(DeviceDescriptor)*) nothrow @nogc;



/// TODO
alias BindGroup = WebGPUObject!"BindGroup";

/// TODO
void setLabel(scope BindGroup.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuBindGroupSetLabel(self, label);
}
private extern(C) void wgpuBindGroupSetLabel(BindGroup.Handle, StringView) nothrow @nogc;



/// TODO
alias BindGroupLayout = WebGPUObject!"BindGroupLayout";

/// TODO
void setLabel(scope BindGroupLayout.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuBindGroupLayoutSetLabel(self, label);
}
private extern(C) void wgpuBindGroupLayoutSetLabel(BindGroupLayout.Handle, StringView) nothrow @nogc;



/// TODO
alias Buffer = WebGPUObject!"Buffer";

/// TODO
void mapAsync(scope Buffer.Handle self, MapMode mode, size_t offset, size_t size) @trusted nothrow @nogc {
    wgpuBufferMapAsync(self, mode, offset, size);
}
private extern(C) void wgpuBufferMapAsync(Buffer.Handle, MapMode, size_t, size_t) nothrow @nogc;

/// Returns a mutable pointer to beginning of the mapped range. See @ref
/// MappedRangeBehavior for error conditions and guarantees. This function is
/// safe to call inside spontaneous callbacks (see @ref CallbackReentrancy). In
/// Wasm, if `memcpy`ing into this range, prefer using @ref
/// wgpuBufferWriteMappedRange instead for better performance.
void* getMappedRange(scope Buffer.Handle self, size_t offset, size_t size) @trusted nothrow @nogc {
    return wgpuBufferGetMappedRange(self, offset, size);
}
private extern(C) void* wgpuBufferGetMappedRange(Buffer.Handle, size_t, size_t) nothrow @nogc;

/// Returns a const pointer to beginning of the mapped range. It must not be
/// written; writing to this range causes undefined behavior. See @ref
/// MappedRangeBehavior for error conditions and guarantees. This function is
/// safe to call inside spontaneous callbacks (see @ref CallbackReentrancy). In
/// Wasm, if `memcpy`ing from this range, prefer using @ref
/// wgpuBufferReadMappedRange instead for better performance.
const(void)* getConstMappedRange(scope Buffer.Handle self, size_t offset, size_t size) @trusted nothrow @nogc {
    return wgpuBufferGetConstMappedRange(self, offset, size);
}
private extern(C) const(void)* wgpuBufferGetConstMappedRange(Buffer.Handle, size_t, size_t) nothrow @nogc;

/// Copies a range of data from the buffer mapping into the provided destination
/// pointer. See @ref MappedRangeBehavior for error conditions and guarantees.
/// This function is safe to call inside spontaneous callbacks (see @ref
/// CallbackReentrancy). In Wasm, this is more efficient than copying from a
/// mapped range into a `malloc`'d range.
Status readMappedRange(scope Buffer.Handle self, size_t offset, void* data, size_t size) @trusted nothrow @nogc {
    return wgpuBufferReadMappedRange(self, offset, &data, size);
}
private extern(C) Status wgpuBufferReadMappedRange(Buffer.Handle, size_t, void*, size_t) nothrow @nogc;

/// Copies a range of data from the provided source pointer into the buffer
/// mapping. See @ref MappedRangeBehavior for error conditions and guarantees.
/// This function is safe to call inside spontaneous callbacks (see @ref
/// CallbackReentrancy). In Wasm, this is more efficient than copying from a
/// `malloc`'d range into a mapped range.
Status writeMappedRange(scope Buffer.Handle self, size_t offset, const(void)* data, size_t size) @trusted nothrow @nogc {
    return wgpuBufferWriteMappedRange(self, offset, &data, size);
}
private extern(C) Status wgpuBufferWriteMappedRange(Buffer.Handle, size_t, const(void)*, size_t) nothrow @nogc;

/// TODO
void setLabel(scope Buffer.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuBufferSetLabel(self, label);
}
private extern(C) void wgpuBufferSetLabel(Buffer.Handle, StringView) nothrow @nogc;

/// TODO
BufferUsage getUsage(scope Buffer.Handle self) @trusted nothrow @nogc {
    return wgpuBufferGetUsage(self);
}
private extern(C) BufferUsage wgpuBufferGetUsage(Buffer.Handle) nothrow @nogc;

/// TODO
ulong getSize(scope Buffer.Handle self) @trusted nothrow @nogc {
    return wgpuBufferGetSize(self);
}
private extern(C) ulong wgpuBufferGetSize(Buffer.Handle) nothrow @nogc;

/// TODO
BufferMapState getMapState(scope Buffer.Handle self) @trusted nothrow @nogc {
    return wgpuBufferGetMapState(self);
}
private extern(C) BufferMapState wgpuBufferGetMapState(Buffer.Handle) nothrow @nogc;

/// TODO
void unmap(scope Buffer.Handle self) @trusted nothrow @nogc {
    wgpuBufferUnmap(self);
}
private extern(C) void wgpuBufferUnmap(Buffer.Handle) nothrow @nogc;

/// TODO
void destroy(scope Buffer.Handle self) @trusted nothrow @nogc {
    wgpuBufferDestroy(self);
}
private extern(C) void wgpuBufferDestroy(Buffer.Handle) nothrow @nogc;



/// TODO
alias CommandBuffer = WebGPUObject!"CommandBuffer";

/// TODO
void setLabel(scope CommandBuffer.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuCommandBufferSetLabel(self, label);
}
private extern(C) void wgpuCommandBufferSetLabel(CommandBuffer.Handle, StringView) nothrow @nogc;



/// TODO
alias CommandEncoder = WebGPUObject!"CommandEncoder";

/// TODO
CommandBuffer.Uniq finish(scope CommandEncoder.Handle self, scope ref const CommandBufferDescriptor descriptor) @trusted nothrow @nogc {
    return CommandBuffer.Uniq(wgpuCommandEncoderFinish(self, &descriptor));
}
private extern(C) CommandBuffer.Handle wgpuCommandEncoderFinish(CommandEncoder.Handle, const(CommandBufferDescriptor)*) nothrow @nogc;

/// TODO
ComputePassEncoder.Uniq beginComputePass(scope CommandEncoder.Handle self, scope ref const ComputePassDescriptor descriptor) @trusted nothrow @nogc {
    return ComputePassEncoder.Uniq(wgpuCommandEncoderBeginComputePass(self, &descriptor));
}
private extern(C) ComputePassEncoder.Handle wgpuCommandEncoderBeginComputePass(CommandEncoder.Handle, const(ComputePassDescriptor)*) nothrow @nogc;

/// TODO
RenderPassEncoder.Uniq beginRenderPass(scope CommandEncoder.Handle self, scope ref const RenderPassDescriptor descriptor) @trusted nothrow @nogc {
    return RenderPassEncoder.Uniq(wgpuCommandEncoderBeginRenderPass(self, &descriptor));
}
private extern(C) RenderPassEncoder.Handle wgpuCommandEncoderBeginRenderPass(CommandEncoder.Handle, const(RenderPassDescriptor)*) nothrow @nogc;

/// TODO
void copyBufferToBuffer(scope CommandEncoder.Handle self, scope Buffer.Handle source, ulong sourceOffset, scope Buffer.Handle destination, ulong destinationOffset, ulong size) @trusted nothrow @nogc {
    wgpuCommandEncoderCopyBufferToBuffer(self, source, sourceOffset, destination, destinationOffset, size);
}
private extern(C) void wgpuCommandEncoderCopyBufferToBuffer(CommandEncoder.Handle, Buffer.Handle, ulong, Buffer.Handle, ulong, ulong) nothrow @nogc;

/// TODO
void copyBufferToTexture(scope CommandEncoder.Handle self, scope ref const TexelCopyBufferInfo source, scope ref const TexelCopyTextureInfo destination, scope ref const Extent3D copySize) @trusted nothrow @nogc {
    wgpuCommandEncoderCopyBufferToTexture(self, &source, &destination, &copySize);
}
private extern(C) void wgpuCommandEncoderCopyBufferToTexture(CommandEncoder.Handle, const(TexelCopyBufferInfo)*, const(TexelCopyTextureInfo)*, const(Extent3D)*) nothrow @nogc;

/// TODO
void copyTextureToBuffer(scope CommandEncoder.Handle self, scope ref const TexelCopyTextureInfo source, scope ref const TexelCopyBufferInfo destination, scope ref const Extent3D copySize) @trusted nothrow @nogc {
    wgpuCommandEncoderCopyTextureToBuffer(self, &source, &destination, &copySize);
}
private extern(C) void wgpuCommandEncoderCopyTextureToBuffer(CommandEncoder.Handle, const(TexelCopyTextureInfo)*, const(TexelCopyBufferInfo)*, const(Extent3D)*) nothrow @nogc;

/// TODO
void copyTextureToTexture(scope CommandEncoder.Handle self, scope ref const TexelCopyTextureInfo source, scope ref const TexelCopyTextureInfo destination, scope ref const Extent3D copySize) @trusted nothrow @nogc {
    wgpuCommandEncoderCopyTextureToTexture(self, &source, &destination, &copySize);
}
private extern(C) void wgpuCommandEncoderCopyTextureToTexture(CommandEncoder.Handle, const(TexelCopyTextureInfo)*, const(TexelCopyTextureInfo)*, const(Extent3D)*) nothrow @nogc;

/// TODO
void clearBuffer(scope CommandEncoder.Handle self, scope Buffer.Handle buffer, ulong offset, ulong size) @trusted nothrow @nogc {
    wgpuCommandEncoderClearBuffer(self, buffer, offset, size);
}
private extern(C) void wgpuCommandEncoderClearBuffer(CommandEncoder.Handle, Buffer.Handle, ulong, ulong) nothrow @nogc;

/// TODO
void insertDebugMarker(scope CommandEncoder.Handle self, scope StringView markerLabel) @trusted nothrow @nogc {
    wgpuCommandEncoderInsertDebugMarker(self, markerLabel);
}
private extern(C) void wgpuCommandEncoderInsertDebugMarker(CommandEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void popDebugGroup(scope CommandEncoder.Handle self) @trusted nothrow @nogc {
    wgpuCommandEncoderPopDebugGroup(self);
}
private extern(C) void wgpuCommandEncoderPopDebugGroup(CommandEncoder.Handle) nothrow @nogc;

/// TODO
void pushDebugGroup(scope CommandEncoder.Handle self, scope StringView groupLabel) @trusted nothrow @nogc {
    wgpuCommandEncoderPushDebugGroup(self, groupLabel);
}
private extern(C) void wgpuCommandEncoderPushDebugGroup(CommandEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void resolveQuerySet(scope CommandEncoder.Handle self, scope QuerySet.Handle querySet, uint firstQuery, uint queryCount, scope Buffer.Handle destination, ulong destinationOffset) @trusted nothrow @nogc {
    wgpuCommandEncoderResolveQuerySet(self, querySet, firstQuery, queryCount, destination, destinationOffset);
}
private extern(C) void wgpuCommandEncoderResolveQuerySet(CommandEncoder.Handle, QuerySet.Handle, uint, uint, Buffer.Handle, ulong) nothrow @nogc;

/// TODO
void writeTimestamp(scope CommandEncoder.Handle self, scope QuerySet.Handle querySet, uint queryIndex) @trusted nothrow @nogc {
    wgpuCommandEncoderWriteTimestamp(self, querySet, queryIndex);
}
private extern(C) void wgpuCommandEncoderWriteTimestamp(CommandEncoder.Handle, QuerySet.Handle, uint) nothrow @nogc;

/// TODO
void setLabel(scope CommandEncoder.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuCommandEncoderSetLabel(self, label);
}
private extern(C) void wgpuCommandEncoderSetLabel(CommandEncoder.Handle, StringView) nothrow @nogc;



/// TODO
alias ComputePassEncoder = WebGPUObject!"ComputePassEncoder";

/// TODO
void insertDebugMarker(scope ComputePassEncoder.Handle self, scope StringView markerLabel) @trusted nothrow @nogc {
    wgpuComputePassEncoderInsertDebugMarker(self, markerLabel);
}
private extern(C) void wgpuComputePassEncoderInsertDebugMarker(ComputePassEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void popDebugGroup(scope ComputePassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuComputePassEncoderPopDebugGroup(self);
}
private extern(C) void wgpuComputePassEncoderPopDebugGroup(ComputePassEncoder.Handle) nothrow @nogc;

/// TODO
void pushDebugGroup(scope ComputePassEncoder.Handle self, scope StringView groupLabel) @trusted nothrow @nogc {
    wgpuComputePassEncoderPushDebugGroup(self, groupLabel);
}
private extern(C) void wgpuComputePassEncoderPushDebugGroup(ComputePassEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void setPipeline(scope ComputePassEncoder.Handle self, scope ComputePipeline.Handle pipeline) @trusted nothrow @nogc {
    wgpuComputePassEncoderSetPipeline(self, pipeline);
}
private extern(C) void wgpuComputePassEncoderSetPipeline(ComputePassEncoder.Handle, ComputePipeline.Handle) nothrow @nogc;

/// TODO
void setBindGroup(scope ComputePassEncoder.Handle self, uint groupIndex, scope BindGroup.Handle group, scope const(uint)[] dynamicOffsets) @trusted nothrow @nogc {
    wgpuComputePassEncoderSetBindGroup(self, groupIndex, group, dynamicOffsets.length, dynamicOffsets.ptr);
}
private extern(C) void wgpuComputePassEncoderSetBindGroup(ComputePassEncoder.Handle, uint, BindGroup.Handle, size_t, const(uint)*) nothrow @nogc;

/// TODO
void setImmediates(scope ComputePassEncoder.Handle self, uint offset, const(void)* data, size_t size) @trusted nothrow @nogc {
    wgpuComputePassEncoderSetImmediates(self, offset, &data, size);
}
private extern(C) void wgpuComputePassEncoderSetImmediates(ComputePassEncoder.Handle, uint, const(void)*, size_t) nothrow @nogc;

/// TODO
void dispatchWorkgroups(scope ComputePassEncoder.Handle self, uint workgroupCountX, uint workgroupCountY, uint workgroupCountZ) @trusted nothrow @nogc {
    wgpuComputePassEncoderDispatchWorkgroups(self, workgroupCountX, workgroupCountY, workgroupCountZ);
}
private extern(C) void wgpuComputePassEncoderDispatchWorkgroups(ComputePassEncoder.Handle, uint, uint, uint) nothrow @nogc;

/// TODO
void dispatchWorkgroupsIndirect(scope ComputePassEncoder.Handle self, scope Buffer.Handle indirectBuffer, ulong indirectOffset) @trusted nothrow @nogc {
    wgpuComputePassEncoderDispatchWorkgroupsIndirect(self, indirectBuffer, indirectOffset);
}
private extern(C) void wgpuComputePassEncoderDispatchWorkgroupsIndirect(ComputePassEncoder.Handle, Buffer.Handle, ulong) nothrow @nogc;

/// TODO
void end(scope ComputePassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuComputePassEncoderEnd(self);
}
private extern(C) void wgpuComputePassEncoderEnd(ComputePassEncoder.Handle) nothrow @nogc;

/// TODO
void setLabel(scope ComputePassEncoder.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuComputePassEncoderSetLabel(self, label);
}
private extern(C) void wgpuComputePassEncoderSetLabel(ComputePassEncoder.Handle, StringView) nothrow @nogc;



/// TODO
alias ComputePipeline = WebGPUObject!"ComputePipeline";

/// TODO
BindGroupLayout.Uniq getBindGroupLayout(scope ComputePipeline.Handle self, uint groupIndex) @trusted nothrow @nogc {
    return BindGroupLayout.Uniq(wgpuComputePipelineGetBindGroupLayout(self, groupIndex));
}
private extern(C) BindGroupLayout.Handle wgpuComputePipelineGetBindGroupLayout(ComputePipeline.Handle, uint) nothrow @nogc;

/// TODO
void setLabel(scope ComputePipeline.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuComputePipelineSetLabel(self, label);
}
private extern(C) void wgpuComputePipelineSetLabel(ComputePipeline.Handle, StringView) nothrow @nogc;



/// TODO Releasing the last ref to a `WGPUDevice` also calls @ref
/// wgpuDeviceDestroy. For more info, see @ref DeviceRelease.
alias Device = WebGPUObject!"Device";

/// TODO
BindGroup.Uniq createBindGroup(scope Device.Handle self, scope ref const BindGroupDescriptor descriptor) @trusted nothrow @nogc {
    return BindGroup.Uniq(wgpuDeviceCreateBindGroup(self, &descriptor));
}
private extern(C) BindGroup.Handle wgpuDeviceCreateBindGroup(Device.Handle, const(BindGroupDescriptor)*) nothrow @nogc;

/// TODO
BindGroupLayout.Uniq createBindGroupLayout(scope Device.Handle self, scope ref const BindGroupLayoutDescriptor descriptor) @trusted nothrow @nogc {
    return BindGroupLayout.Uniq(wgpuDeviceCreateBindGroupLayout(self, &descriptor));
}
private extern(C) BindGroupLayout.Handle wgpuDeviceCreateBindGroupLayout(Device.Handle, const(BindGroupLayoutDescriptor)*) nothrow @nogc;

/// TODO If @ref WGPUBufferDescriptor::mappedAtCreation is `true` and the
/// mapping allocation fails, returns `NULL`.
Buffer.Uniq createBuffer(scope Device.Handle self, scope ref const BufferDescriptor descriptor) @trusted nothrow @nogc {
    return Buffer.Uniq(wgpuDeviceCreateBuffer(self, &descriptor));
}
private extern(C) Buffer.Handle wgpuDeviceCreateBuffer(Device.Handle, const(BufferDescriptor)*) nothrow @nogc;

/// TODO
CommandEncoder.Uniq createCommandEncoder(scope Device.Handle self, scope ref const CommandEncoderDescriptor descriptor) @trusted nothrow @nogc {
    return CommandEncoder.Uniq(wgpuDeviceCreateCommandEncoder(self, &descriptor));
}
private extern(C) CommandEncoder.Handle wgpuDeviceCreateCommandEncoder(Device.Handle, const(CommandEncoderDescriptor)*) nothrow @nogc;

/// TODO
ComputePipeline.Uniq createComputePipeline(scope Device.Handle self, scope ref const ComputePipelineDescriptor descriptor) @trusted nothrow @nogc {
    return ComputePipeline.Uniq(wgpuDeviceCreateComputePipeline(self, &descriptor));
}
private extern(C) ComputePipeline.Handle wgpuDeviceCreateComputePipeline(Device.Handle, const(ComputePipelineDescriptor)*) nothrow @nogc;

/// TODO
void createComputePipelineAsync(scope Device.Handle self, scope ref const ComputePipelineDescriptor descriptor) @trusted nothrow @nogc {
    wgpuDeviceCreateComputePipelineAsync(self, &descriptor);
}
private extern(C) void wgpuDeviceCreateComputePipelineAsync(Device.Handle, const(ComputePipelineDescriptor)*) nothrow @nogc;

/// TODO
PipelineLayout.Uniq createPipelineLayout(scope Device.Handle self, scope ref const PipelineLayoutDescriptor descriptor) @trusted nothrow @nogc {
    return PipelineLayout.Uniq(wgpuDeviceCreatePipelineLayout(self, &descriptor));
}
private extern(C) PipelineLayout.Handle wgpuDeviceCreatePipelineLayout(Device.Handle, const(PipelineLayoutDescriptor)*) nothrow @nogc;

/// TODO
QuerySet.Uniq createQuerySet(scope Device.Handle self, scope ref const QuerySetDescriptor descriptor) @trusted nothrow @nogc {
    return QuerySet.Uniq(wgpuDeviceCreateQuerySet(self, &descriptor));
}
private extern(C) QuerySet.Handle wgpuDeviceCreateQuerySet(Device.Handle, const(QuerySetDescriptor)*) nothrow @nogc;

/// TODO
void createRenderPipelineAsync(scope Device.Handle self, scope ref const RenderPipelineDescriptor descriptor) @trusted nothrow @nogc {
    wgpuDeviceCreateRenderPipelineAsync(self, &descriptor);
}
private extern(C) void wgpuDeviceCreateRenderPipelineAsync(Device.Handle, const(RenderPipelineDescriptor)*) nothrow @nogc;

/// TODO
RenderBundleEncoder.Uniq createRenderBundleEncoder(scope Device.Handle self, scope ref const RenderBundleEncoderDescriptor descriptor) @trusted nothrow @nogc {
    return RenderBundleEncoder.Uniq(wgpuDeviceCreateRenderBundleEncoder(self, &descriptor));
}
private extern(C) RenderBundleEncoder.Handle wgpuDeviceCreateRenderBundleEncoder(Device.Handle, const(RenderBundleEncoderDescriptor)*) nothrow @nogc;

/// TODO
RenderPipeline.Uniq createRenderPipeline(scope Device.Handle self, scope ref const RenderPipelineDescriptor descriptor) @trusted nothrow @nogc {
    return RenderPipeline.Uniq(wgpuDeviceCreateRenderPipeline(self, &descriptor));
}
private extern(C) RenderPipeline.Handle wgpuDeviceCreateRenderPipeline(Device.Handle, const(RenderPipelineDescriptor)*) nothrow @nogc;

/// TODO
Sampler.Uniq createSampler(scope Device.Handle self, scope ref const SamplerDescriptor descriptor) @trusted nothrow @nogc {
    return Sampler.Uniq(wgpuDeviceCreateSampler(self, &descriptor));
}
private extern(C) Sampler.Handle wgpuDeviceCreateSampler(Device.Handle, const(SamplerDescriptor)*) nothrow @nogc;

/// TODO
ShaderModule.Uniq createShaderModule(scope Device.Handle self, scope ref const ShaderModuleDescriptor descriptor) @trusted nothrow @nogc {
    return ShaderModule.Uniq(wgpuDeviceCreateShaderModule(self, &descriptor));
}
private extern(C) ShaderModule.Handle wgpuDeviceCreateShaderModule(Device.Handle, const(ShaderModuleDescriptor)*) nothrow @nogc;

/// TODO
Texture.Uniq createTexture(scope Device.Handle self, scope ref const TextureDescriptor descriptor) @trusted nothrow @nogc {
    return Texture.Uniq(wgpuDeviceCreateTexture(self, &descriptor));
}
private extern(C) Texture.Handle wgpuDeviceCreateTexture(Device.Handle, const(TextureDescriptor)*) nothrow @nogc;

/// TODO
void destroy(scope Device.Handle self) @trusted nothrow @nogc {
    wgpuDeviceDestroy(self);
}
private extern(C) void wgpuDeviceDestroy(Device.Handle) nothrow @nogc;

/// 
Future getLostFuture(scope Device.Handle self) @trusted nothrow @nogc {
    return wgpuDeviceGetLostFuture(self);
}
private extern(C) Future wgpuDeviceGetLostFuture(Device.Handle) nothrow @nogc;

/// TODO
Status getLimits(scope Device.Handle self, scope ref Limits limits) @trusted nothrow @nogc {
    return wgpuDeviceGetLimits(self, &limits);
}
private extern(C) Status wgpuDeviceGetLimits(Device.Handle, Limits*) nothrow @nogc;

/// TODO
bool hasFeature(scope Device.Handle self, FeatureName feature) @trusted nothrow @nogc {
    return wgpuDeviceHasFeature(self, feature);
}
private extern(C) bool wgpuDeviceHasFeature(Device.Handle, FeatureName) nothrow @nogc;

/// Get the list of @ref WGPUFeatureName values supported by the device.
void getFeatures(scope Device.Handle self, scope ref SupportedFeatures features) @trusted nothrow @nogc {
    wgpuDeviceGetFeatures(self, &features);
}
private extern(C) void wgpuDeviceGetFeatures(Device.Handle, SupportedFeatures*) nothrow @nogc;

/// TODO
Status getAdapterInfo(scope Device.Handle self, scope ref AdapterInfo adapterInfo) @trusted nothrow @nogc {
    return wgpuDeviceGetAdapterInfo(self, &adapterInfo);
}
private extern(C) Status wgpuDeviceGetAdapterInfo(Device.Handle, AdapterInfo*) nothrow @nogc;

/// TODO
Queue.Uniq getQueue(scope Device.Handle self) @trusted nothrow @nogc {
    return Queue.Uniq(wgpuDeviceGetQueue(self));
}
private extern(C) Queue.Handle wgpuDeviceGetQueue(Device.Handle) nothrow @nogc;

/// Pushes an error scope to the current thread's error scope stack. See @ref
/// ErrorScopes.
void pushErrorScope(scope Device.Handle self, ErrorFilter filter) @trusted nothrow @nogc {
    wgpuDevicePushErrorScope(self, filter);
}
private extern(C) void wgpuDevicePushErrorScope(Device.Handle, ErrorFilter) nothrow @nogc;

/// Pops an error scope to the current thread's error scope stack,
/// asynchronously returning the result. See @ref ErrorScopes.
void popErrorScope(scope Device.Handle self) @trusted nothrow @nogc {
    wgpuDevicePopErrorScope(self);
}
private extern(C) void wgpuDevicePopErrorScope(Device.Handle) nothrow @nogc;

/// TODO
void setLabel(scope Device.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuDeviceSetLabel(self, label);
}
private extern(C) void wgpuDeviceSetLabel(Device.Handle, StringView) nothrow @nogc;



/// A sampleable 2D texture that may perform 0-copy YUV sampling internally.
/// Creation of @ref WGPUExternalTexture is extremely implementation-dependent
/// and not defined in this header.
alias ExternalTexture = WebGPUObject!"ExternalTexture";

/// TODO
void setLabel(scope ExternalTexture.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuExternalTextureSetLabel(self, label);
}
private extern(C) void wgpuExternalTextureSetLabel(ExternalTexture.Handle, StringView) nothrow @nogc;



/// TODO
alias Instance = WebGPUObject!"Instance";

/// Creates a @ref WGPUSurface, see @ref Surface-Creation for more details.
Surface.Uniq createSurface(scope Instance.Handle self, scope ref const SurfaceDescriptor descriptor) @trusted nothrow @nogc {
    return Surface.Uniq(wgpuInstanceCreateSurface(self, &descriptor));
}
private extern(C) Surface.Handle wgpuInstanceCreateSurface(Instance.Handle, const(SurfaceDescriptor)*) nothrow @nogc;

/// Get the list of @ref WGPUWGSLLanguageFeatureName values supported by the
/// instance.
void getWGSLLanguageFeatures(scope Instance.Handle self, scope ref SupportedWGSLLanguageFeatures features) @trusted nothrow @nogc {
    wgpuInstanceGetWGSLLanguageFeatures(self, &features);
}
private extern(C) void wgpuInstanceGetWGSLLanguageFeatures(Instance.Handle, SupportedWGSLLanguageFeatures*) nothrow @nogc;

/// TODO
bool hasWGSLLanguageFeature(scope Instance.Handle self, WGSLLanguageFeatureName feature) @trusted nothrow @nogc {
    return wgpuInstanceHasWGSLLanguageFeature(self, feature);
}
private extern(C) bool wgpuInstanceHasWGSLLanguageFeature(Instance.Handle, WGSLLanguageFeatureName) nothrow @nogc;

/// Processes asynchronous events on this `WGPUInstance`, calling any callbacks
/// for asynchronous operations created with @ref
/// WGPUCallbackMode_AllowProcessEvents. See @ref Process-Events for more
/// information.
void processEvents(scope Instance.Handle self) @trusted nothrow @nogc {
    wgpuInstanceProcessEvents(self);
}
private extern(C) void wgpuInstanceProcessEvents(Instance.Handle) nothrow @nogc;

/// TODO
void requestAdapter(scope Instance.Handle self, scope ref const RequestAdapterOptions options) @trusted nothrow @nogc {
    wgpuInstanceRequestAdapter(self, &options);
}
private extern(C) void wgpuInstanceRequestAdapter(Instance.Handle, const(RequestAdapterOptions)*) nothrow @nogc;

/// Wait for at least one WGPUFuture in `futures` to complete, and call
/// callbacks of the respective completed asynchronous operations. See @ref
/// Wait-Any for more information.
WaitStatus waitAny(scope Instance.Handle self, size_t futureCount, scope ref FutureWaitInfo futures, ulong timeoutNS) @trusted nothrow @nogc {
    return wgpuInstanceWaitAny(self, futureCount, &futures, timeoutNS);
}
private extern(C) WaitStatus wgpuInstanceWaitAny(Instance.Handle, size_t, FutureWaitInfo*, ulong) nothrow @nogc;



/// TODO
alias PipelineLayout = WebGPUObject!"PipelineLayout";

/// TODO
void setLabel(scope PipelineLayout.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuPipelineLayoutSetLabel(self, label);
}
private extern(C) void wgpuPipelineLayoutSetLabel(PipelineLayout.Handle, StringView) nothrow @nogc;



/// TODO
alias QuerySet = WebGPUObject!"QuerySet";

/// TODO
void setLabel(scope QuerySet.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuQuerySetSetLabel(self, label);
}
private extern(C) void wgpuQuerySetSetLabel(QuerySet.Handle, StringView) nothrow @nogc;

/// TODO
QueryType getType(scope QuerySet.Handle self) @trusted nothrow @nogc {
    return wgpuQuerySetGetType(self);
}
private extern(C) QueryType wgpuQuerySetGetType(QuerySet.Handle) nothrow @nogc;

/// TODO
uint getCount(scope QuerySet.Handle self) @trusted nothrow @nogc {
    return wgpuQuerySetGetCount(self);
}
private extern(C) uint wgpuQuerySetGetCount(QuerySet.Handle) nothrow @nogc;

/// TODO
void destroy(scope QuerySet.Handle self) @trusted nothrow @nogc {
    wgpuQuerySetDestroy(self);
}
private extern(C) void wgpuQuerySetDestroy(QuerySet.Handle) nothrow @nogc;



/// TODO
alias Queue = WebGPUObject!"Queue";

/// TODO
void submit(scope Queue.Handle self, scope const(CommandBuffer.Handle)[] commands) @trusted nothrow @nogc {
    wgpuQueueSubmit(self, commands.length, commands.ptr);
}
private extern(C) void wgpuQueueSubmit(Queue.Handle, size_t, const(CommandBuffer.Handle)*) nothrow @nogc;

/// TODO
void onSubmittedWorkDone(scope Queue.Handle self) @trusted nothrow @nogc {
    wgpuQueueOnSubmittedWorkDone(self);
}
private extern(C) void wgpuQueueOnSubmittedWorkDone(Queue.Handle) nothrow @nogc;

/// Produces a @ref DeviceError both content-timeline (`size` alignment) and
/// device-timeline errors defined by the WebGPU specification.
void writeBuffer(scope Queue.Handle self, scope Buffer.Handle buffer, ulong bufferOffset, const(void)* data, size_t size) @trusted nothrow @nogc {
    wgpuQueueWriteBuffer(self, buffer, bufferOffset, &data, size);
}
private extern(C) void wgpuQueueWriteBuffer(Queue.Handle, Buffer.Handle, ulong, const(void)*, size_t) nothrow @nogc;

/// TODO
void writeTexture(scope Queue.Handle self, scope ref const TexelCopyTextureInfo destination, const(void)* data, size_t dataSize, scope ref const TexelCopyBufferLayout dataLayout, scope ref const Extent3D writeSize) @trusted nothrow @nogc {
    wgpuQueueWriteTexture(self, &destination, &data, dataSize, &dataLayout, &writeSize);
}
private extern(C) void wgpuQueueWriteTexture(Queue.Handle, const(TexelCopyTextureInfo)*, const(void)*, size_t, const(TexelCopyBufferLayout)*, const(Extent3D)*) nothrow @nogc;

/// TODO
void setLabel(scope Queue.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuQueueSetLabel(self, label);
}
private extern(C) void wgpuQueueSetLabel(Queue.Handle, StringView) nothrow @nogc;



/// TODO
alias RenderBundle = WebGPUObject!"RenderBundle";

/// TODO
void setLabel(scope RenderBundle.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuRenderBundleSetLabel(self, label);
}
private extern(C) void wgpuRenderBundleSetLabel(RenderBundle.Handle, StringView) nothrow @nogc;



/// TODO
alias RenderBundleEncoder = WebGPUObject!"RenderBundleEncoder";

/// TODO
void setPipeline(scope RenderBundleEncoder.Handle self, scope RenderPipeline.Handle pipeline) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderSetPipeline(self, pipeline);
}
private extern(C) void wgpuRenderBundleEncoderSetPipeline(RenderBundleEncoder.Handle, RenderPipeline.Handle) nothrow @nogc;

/// TODO
void setBindGroup(scope RenderBundleEncoder.Handle self, uint groupIndex, scope BindGroup.Handle group, scope const(uint)[] dynamicOffsets) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderSetBindGroup(self, groupIndex, group, dynamicOffsets.length, dynamicOffsets.ptr);
}
private extern(C) void wgpuRenderBundleEncoderSetBindGroup(RenderBundleEncoder.Handle, uint, BindGroup.Handle, size_t, const(uint)*) nothrow @nogc;

/// TODO
void setImmediates(scope RenderBundleEncoder.Handle self, uint offset, const(void)* data, size_t size) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderSetImmediates(self, offset, &data, size);
}
private extern(C) void wgpuRenderBundleEncoderSetImmediates(RenderBundleEncoder.Handle, uint, const(void)*, size_t) nothrow @nogc;

/// TODO
void draw(scope RenderBundleEncoder.Handle self, uint vertexCount, uint instanceCount, uint firstVertex, uint firstInstance) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderDraw(self, vertexCount, instanceCount, firstVertex, firstInstance);
}
private extern(C) void wgpuRenderBundleEncoderDraw(RenderBundleEncoder.Handle, uint, uint, uint, uint) nothrow @nogc;

/// TODO
void drawIndexed(scope RenderBundleEncoder.Handle self, uint indexCount, uint instanceCount, uint firstIndex, int baseVertex, uint firstInstance) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderDrawIndexed(self, indexCount, instanceCount, firstIndex, baseVertex, firstInstance);
}
private extern(C) void wgpuRenderBundleEncoderDrawIndexed(RenderBundleEncoder.Handle, uint, uint, uint, int, uint) nothrow @nogc;

/// TODO
void drawIndirect(scope RenderBundleEncoder.Handle self, scope Buffer.Handle indirectBuffer, ulong indirectOffset) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderDrawIndirect(self, indirectBuffer, indirectOffset);
}
private extern(C) void wgpuRenderBundleEncoderDrawIndirect(RenderBundleEncoder.Handle, Buffer.Handle, ulong) nothrow @nogc;

/// TODO
void drawIndexedIndirect(scope RenderBundleEncoder.Handle self, scope Buffer.Handle indirectBuffer, ulong indirectOffset) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderDrawIndexedIndirect(self, indirectBuffer, indirectOffset);
}
private extern(C) void wgpuRenderBundleEncoderDrawIndexedIndirect(RenderBundleEncoder.Handle, Buffer.Handle, ulong) nothrow @nogc;

/// TODO
void insertDebugMarker(scope RenderBundleEncoder.Handle self, scope StringView markerLabel) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderInsertDebugMarker(self, markerLabel);
}
private extern(C) void wgpuRenderBundleEncoderInsertDebugMarker(RenderBundleEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void popDebugGroup(scope RenderBundleEncoder.Handle self) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderPopDebugGroup(self);
}
private extern(C) void wgpuRenderBundleEncoderPopDebugGroup(RenderBundleEncoder.Handle) nothrow @nogc;

/// TODO
void pushDebugGroup(scope RenderBundleEncoder.Handle self, scope StringView groupLabel) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderPushDebugGroup(self, groupLabel);
}
private extern(C) void wgpuRenderBundleEncoderPushDebugGroup(RenderBundleEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void setVertexBuffer(scope RenderBundleEncoder.Handle self, uint slot, scope Buffer.Handle buffer, ulong offset, ulong size) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderSetVertexBuffer(self, slot, buffer, offset, size);
}
private extern(C) void wgpuRenderBundleEncoderSetVertexBuffer(RenderBundleEncoder.Handle, uint, Buffer.Handle, ulong, ulong) nothrow @nogc;

/// TODO
void setIndexBuffer(scope RenderBundleEncoder.Handle self, scope Buffer.Handle buffer, IndexFormat format, ulong offset, ulong size) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderSetIndexBuffer(self, buffer, format, offset, size);
}
private extern(C) void wgpuRenderBundleEncoderSetIndexBuffer(RenderBundleEncoder.Handle, Buffer.Handle, IndexFormat, ulong, ulong) nothrow @nogc;

/// TODO
RenderBundle.Uniq finish(scope RenderBundleEncoder.Handle self, scope ref const RenderBundleDescriptor descriptor) @trusted nothrow @nogc {
    return RenderBundle.Uniq(wgpuRenderBundleEncoderFinish(self, &descriptor));
}
private extern(C) RenderBundle.Handle wgpuRenderBundleEncoderFinish(RenderBundleEncoder.Handle, const(RenderBundleDescriptor)*) nothrow @nogc;

/// TODO
void setLabel(scope RenderBundleEncoder.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuRenderBundleEncoderSetLabel(self, label);
}
private extern(C) void wgpuRenderBundleEncoderSetLabel(RenderBundleEncoder.Handle, StringView) nothrow @nogc;



/// TODO
alias RenderPassEncoder = WebGPUObject!"RenderPassEncoder";

/// TODO
void setPipeline(scope RenderPassEncoder.Handle self, scope RenderPipeline.Handle pipeline) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetPipeline(self, pipeline);
}
private extern(C) void wgpuRenderPassEncoderSetPipeline(RenderPassEncoder.Handle, RenderPipeline.Handle) nothrow @nogc;

/// TODO
void setBindGroup(scope RenderPassEncoder.Handle self, uint groupIndex, scope BindGroup.Handle group, scope const(uint)[] dynamicOffsets) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetBindGroup(self, groupIndex, group, dynamicOffsets.length, dynamicOffsets.ptr);
}
private extern(C) void wgpuRenderPassEncoderSetBindGroup(RenderPassEncoder.Handle, uint, BindGroup.Handle, size_t, const(uint)*) nothrow @nogc;

/// TODO
void setImmediates(scope RenderPassEncoder.Handle self, uint offset, const(void)* data, size_t size) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetImmediates(self, offset, &data, size);
}
private extern(C) void wgpuRenderPassEncoderSetImmediates(RenderPassEncoder.Handle, uint, const(void)*, size_t) nothrow @nogc;

/// TODO
void draw(scope RenderPassEncoder.Handle self, uint vertexCount, uint instanceCount, uint firstVertex, uint firstInstance) @trusted nothrow @nogc {
    wgpuRenderPassEncoderDraw(self, vertexCount, instanceCount, firstVertex, firstInstance);
}
private extern(C) void wgpuRenderPassEncoderDraw(RenderPassEncoder.Handle, uint, uint, uint, uint) nothrow @nogc;

/// TODO
void drawIndexed(scope RenderPassEncoder.Handle self, uint indexCount, uint instanceCount, uint firstIndex, int baseVertex, uint firstInstance) @trusted nothrow @nogc {
    wgpuRenderPassEncoderDrawIndexed(self, indexCount, instanceCount, firstIndex, baseVertex, firstInstance);
}
private extern(C) void wgpuRenderPassEncoderDrawIndexed(RenderPassEncoder.Handle, uint, uint, uint, int, uint) nothrow @nogc;

/// TODO
void drawIndirect(scope RenderPassEncoder.Handle self, scope Buffer.Handle indirectBuffer, ulong indirectOffset) @trusted nothrow @nogc {
    wgpuRenderPassEncoderDrawIndirect(self, indirectBuffer, indirectOffset);
}
private extern(C) void wgpuRenderPassEncoderDrawIndirect(RenderPassEncoder.Handle, Buffer.Handle, ulong) nothrow @nogc;

/// TODO
void drawIndexedIndirect(scope RenderPassEncoder.Handle self, scope Buffer.Handle indirectBuffer, ulong indirectOffset) @trusted nothrow @nogc {
    wgpuRenderPassEncoderDrawIndexedIndirect(self, indirectBuffer, indirectOffset);
}
private extern(C) void wgpuRenderPassEncoderDrawIndexedIndirect(RenderPassEncoder.Handle, Buffer.Handle, ulong) nothrow @nogc;

/// TODO
void executeBundles(scope RenderPassEncoder.Handle self, scope const(RenderBundle.Handle)[] bundles) @trusted nothrow @nogc {
    wgpuRenderPassEncoderExecuteBundles(self, bundles.length, bundles.ptr);
}
private extern(C) void wgpuRenderPassEncoderExecuteBundles(RenderPassEncoder.Handle, size_t, const(RenderBundle.Handle)*) nothrow @nogc;

/// TODO
void insertDebugMarker(scope RenderPassEncoder.Handle self, scope StringView markerLabel) @trusted nothrow @nogc {
    wgpuRenderPassEncoderInsertDebugMarker(self, markerLabel);
}
private extern(C) void wgpuRenderPassEncoderInsertDebugMarker(RenderPassEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void popDebugGroup(scope RenderPassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuRenderPassEncoderPopDebugGroup(self);
}
private extern(C) void wgpuRenderPassEncoderPopDebugGroup(RenderPassEncoder.Handle) nothrow @nogc;

/// TODO
void pushDebugGroup(scope RenderPassEncoder.Handle self, scope StringView groupLabel) @trusted nothrow @nogc {
    wgpuRenderPassEncoderPushDebugGroup(self, groupLabel);
}
private extern(C) void wgpuRenderPassEncoderPushDebugGroup(RenderPassEncoder.Handle, StringView) nothrow @nogc;

/// TODO
void setStencilReference(scope RenderPassEncoder.Handle self, uint reference) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetStencilReference(self, reference);
}
private extern(C) void wgpuRenderPassEncoderSetStencilReference(RenderPassEncoder.Handle, uint) nothrow @nogc;

/// TODO
void setBlendConstant(scope RenderPassEncoder.Handle self, scope ref const Color color) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetBlendConstant(self, &color);
}
private extern(C) void wgpuRenderPassEncoderSetBlendConstant(RenderPassEncoder.Handle, const(Color)*) nothrow @nogc;

/// TODO If any argument is non-finite, produces a @ref
/// NonFiniteFloatValueError.
void setViewport(scope RenderPassEncoder.Handle self, float x, float y, float width, float height, float minDepth, float maxDepth) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetViewport(self, x, y, width, height, minDepth, maxDepth);
}
private extern(C) void wgpuRenderPassEncoderSetViewport(RenderPassEncoder.Handle, float, float, float, float, float, float) nothrow @nogc;

/// TODO
void setScissorRect(scope RenderPassEncoder.Handle self, uint x, uint y, uint width, uint height) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetScissorRect(self, x, y, width, height);
}
private extern(C) void wgpuRenderPassEncoderSetScissorRect(RenderPassEncoder.Handle, uint, uint, uint, uint) nothrow @nogc;

/// TODO
void setVertexBuffer(scope RenderPassEncoder.Handle self, uint slot, scope Buffer.Handle buffer, ulong offset, ulong size) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetVertexBuffer(self, slot, buffer, offset, size);
}
private extern(C) void wgpuRenderPassEncoderSetVertexBuffer(RenderPassEncoder.Handle, uint, Buffer.Handle, ulong, ulong) nothrow @nogc;

/// TODO
void setIndexBuffer(scope RenderPassEncoder.Handle self, scope Buffer.Handle buffer, IndexFormat format, ulong offset, ulong size) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetIndexBuffer(self, buffer, format, offset, size);
}
private extern(C) void wgpuRenderPassEncoderSetIndexBuffer(RenderPassEncoder.Handle, Buffer.Handle, IndexFormat, ulong, ulong) nothrow @nogc;

/// TODO
void beginOcclusionQuery(scope RenderPassEncoder.Handle self, uint queryIndex) @trusted nothrow @nogc {
    wgpuRenderPassEncoderBeginOcclusionQuery(self, queryIndex);
}
private extern(C) void wgpuRenderPassEncoderBeginOcclusionQuery(RenderPassEncoder.Handle, uint) nothrow @nogc;

/// TODO
void endOcclusionQuery(scope RenderPassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuRenderPassEncoderEndOcclusionQuery(self);
}
private extern(C) void wgpuRenderPassEncoderEndOcclusionQuery(RenderPassEncoder.Handle) nothrow @nogc;

/// TODO
void end(scope RenderPassEncoder.Handle self) @trusted nothrow @nogc {
    wgpuRenderPassEncoderEnd(self);
}
private extern(C) void wgpuRenderPassEncoderEnd(RenderPassEncoder.Handle) nothrow @nogc;

/// TODO
void setLabel(scope RenderPassEncoder.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuRenderPassEncoderSetLabel(self, label);
}
private extern(C) void wgpuRenderPassEncoderSetLabel(RenderPassEncoder.Handle, StringView) nothrow @nogc;



/// TODO
alias RenderPipeline = WebGPUObject!"RenderPipeline";

/// TODO
BindGroupLayout.Uniq getBindGroupLayout(scope RenderPipeline.Handle self, uint groupIndex) @trusted nothrow @nogc {
    return BindGroupLayout.Uniq(wgpuRenderPipelineGetBindGroupLayout(self, groupIndex));
}
private extern(C) BindGroupLayout.Handle wgpuRenderPipelineGetBindGroupLayout(RenderPipeline.Handle, uint) nothrow @nogc;

/// TODO
void setLabel(scope RenderPipeline.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuRenderPipelineSetLabel(self, label);
}
private extern(C) void wgpuRenderPipelineSetLabel(RenderPipeline.Handle, StringView) nothrow @nogc;



/// TODO
alias Sampler = WebGPUObject!"Sampler";

/// TODO
void setLabel(scope Sampler.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuSamplerSetLabel(self, label);
}
private extern(C) void wgpuSamplerSetLabel(Sampler.Handle, StringView) nothrow @nogc;



/// TODO
alias ShaderModule = WebGPUObject!"ShaderModule";

/// TODO
void getCompilationInfo(scope ShaderModule.Handle self) @trusted nothrow @nogc {
    wgpuShaderModuleGetCompilationInfo(self);
}
private extern(C) void wgpuShaderModuleGetCompilationInfo(ShaderModule.Handle) nothrow @nogc;

/// TODO
void setLabel(scope ShaderModule.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuShaderModuleSetLabel(self, label);
}
private extern(C) void wgpuShaderModuleSetLabel(ShaderModule.Handle, StringView) nothrow @nogc;



/// An object used to continuously present image data to the user, see @ref
/// Surfaces for more details.
alias Surface = WebGPUObject!"Surface";

/// Configures parameters for rendering to `surface`. Produces a @ref
/// DeviceError for all content-timeline errors defined by the WebGPU
/// specification. See @ref Surface-Configuration for more details.
void configure(scope Surface.Handle self, scope ref const SurfaceConfiguration config) @trusted nothrow @nogc {
    wgpuSurfaceConfigure(self, &config);
}
private extern(C) void wgpuSurfaceConfigure(Surface.Handle, const(SurfaceConfiguration)*) nothrow @nogc;

/// Provides information on how `adapter` is able to use `surface`. See @ref
/// Surface-Capabilities for more details.
Status getCapabilities(scope Surface.Handle self, scope Adapter.Handle adapter, scope ref SurfaceCapabilities capabilities) @trusted nothrow @nogc {
    return wgpuSurfaceGetCapabilities(self, adapter, &capabilities);
}
private extern(C) Status wgpuSurfaceGetCapabilities(Surface.Handle, Adapter.Handle, SurfaceCapabilities*) nothrow @nogc;

/// Returns the @ref WGPUTexture to render to `surface` this frame along with
/// metadata on the frame. Returns `NULL` and @ref
/// WGPUSurfaceGetCurrentTextureStatus_Error if the surface is not configured.
/// See @ref Surface-Presenting for more details.
void getCurrentTexture(scope Surface.Handle self, scope ref SurfaceTexture surfaceTexture) @trusted nothrow @nogc {
    wgpuSurfaceGetCurrentTexture(self, &surfaceTexture);
}
private extern(C) void wgpuSurfaceGetCurrentTexture(Surface.Handle, SurfaceTexture*) nothrow @nogc;

/// Shows `surface`'s current texture to the user. See @ref Surface-Presenting
/// for more details.
Status present(scope Surface.Handle self) @trusted nothrow @nogc {
    return wgpuSurfacePresent(self);
}
private extern(C) Status wgpuSurfacePresent(Surface.Handle) nothrow @nogc;

/// Removes the configuration for `surface`. See @ref Surface-Configuration for
/// more details.
void unconfigure(scope Surface.Handle self) @trusted nothrow @nogc {
    wgpuSurfaceUnconfigure(self);
}
private extern(C) void wgpuSurfaceUnconfigure(Surface.Handle) nothrow @nogc;

/// Modifies the label used to refer to `surface`.
void setLabel(scope Surface.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuSurfaceSetLabel(self, label);
}
private extern(C) void wgpuSurfaceSetLabel(Surface.Handle, StringView) nothrow @nogc;



/// TODO
alias Texture = WebGPUObject!"Texture";

/// TODO
TextureView.Uniq createView(scope Texture.Handle self, scope ref const TextureViewDescriptor descriptor) @trusted nothrow @nogc {
    return TextureView.Uniq(wgpuTextureCreateView(self, &descriptor));
}
private extern(C) TextureView.Handle wgpuTextureCreateView(Texture.Handle, const(TextureViewDescriptor)*) nothrow @nogc;

/// TODO
void setLabel(scope Texture.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuTextureSetLabel(self, label);
}
private extern(C) void wgpuTextureSetLabel(Texture.Handle, StringView) nothrow @nogc;

/// TODO
uint getWidth(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetWidth(self);
}
private extern(C) uint wgpuTextureGetWidth(Texture.Handle) nothrow @nogc;

/// TODO
uint getHeight(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetHeight(self);
}
private extern(C) uint wgpuTextureGetHeight(Texture.Handle) nothrow @nogc;

/// TODO
uint getDepthOrArrayLayers(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetDepthOrArrayLayers(self);
}
private extern(C) uint wgpuTextureGetDepthOrArrayLayers(Texture.Handle) nothrow @nogc;

/// TODO
uint getMipLevelCount(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetMipLevelCount(self);
}
private extern(C) uint wgpuTextureGetMipLevelCount(Texture.Handle) nothrow @nogc;

/// TODO
uint getSampleCount(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetSampleCount(self);
}
private extern(C) uint wgpuTextureGetSampleCount(Texture.Handle) nothrow @nogc;

/// TODO
TextureDimension getDimension(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetDimension(self);
}
private extern(C) TextureDimension wgpuTextureGetDimension(Texture.Handle) nothrow @nogc;

/// TODO
TextureViewDimension getTextureBindingViewDimension(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetTextureBindingViewDimension(self);
}
private extern(C) TextureViewDimension wgpuTextureGetTextureBindingViewDimension(Texture.Handle) nothrow @nogc;

/// TODO
TextureFormat getFormat(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetFormat(self);
}
private extern(C) TextureFormat wgpuTextureGetFormat(Texture.Handle) nothrow @nogc;

/// TODO
TextureUsage getUsage(scope Texture.Handle self) @trusted nothrow @nogc {
    return wgpuTextureGetUsage(self);
}
private extern(C) TextureUsage wgpuTextureGetUsage(Texture.Handle) nothrow @nogc;

/// TODO
void destroy(scope Texture.Handle self) @trusted nothrow @nogc {
    wgpuTextureDestroy(self);
}
private extern(C) void wgpuTextureDestroy(Texture.Handle) nothrow @nogc;



/// TODO
alias TextureView = WebGPUObject!"TextureView";

/// TODO
void setLabel(scope TextureView.Handle self, scope StringView label) @trusted nothrow @nogc {
    wgpuTextureViewSetLabel(self, label);
}
private extern(C) void wgpuTextureViewSetLabel(TextureView.Handle, StringView) nothrow @nogc;



