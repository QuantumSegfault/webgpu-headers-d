module webgpu.webgpu;

import webgpu.common : BitFlags;

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


struct BufferMap {}
struct CompilationInfo {}
struct CreateComputePipelineAsync {}
struct CreateRenderPipelineAsync {}
struct DeviceLost {}
struct PopErrorScope {}
struct QueueWorkDone {}
struct RequestAdapter {}
struct RequestDevice {}
struct UncapturedError {}

void createInstance() {}
void getInstanceFeatures() {}
void getInstanceLimits() {}
void hasInstanceFeature() {}

/// TODO
extern(C) struct AdapterInfo {
    /// TODO
    StringView vendor;
    /// TODO
    StringView architecture;
    /// TODO
    StringView device;
    /// TODO
    StringView description;
    /// TODO
    BackendType backendType;
    /// TODO
    AdapterType adapterType;
    /// TODO
    uint vendorID;
    /// TODO
    uint deviceID;
    /// TODO
    uint subgroupMinSize;
    /// TODO
    uint subgroupMaxSize;
}

/// TODO
extern(C) struct BindGroupDescriptor {
    /// TODO
    StringView label;
    /// TODO
    BindGroupLayout layout;
    /// TODO
    const(BindGroupEntry)[] entries;
}

/// TODO
extern(C) struct BindGroupEntry {
    /// Binding index in the bind group.
    uint binding;
    /// Set this if the binding is a buffer object. Otherwise must be null.
    Buffer buffer;
    /// If the binding is a buffer, this is the byte offset of the binding
    /// range. Otherwise ignored.
    ulong offset;
    /// If the binding is a buffer, this is the byte size of the binding range
    /// (@ref WGPU_WHOLE_SIZE means the binding ends at the end of the buffer).
    /// Otherwise ignored.
    ulong size;
    /// Set this if the binding is a sampler object. Otherwise must be null.
    Sampler sampler;
    /// Set this if the binding is a texture view object. Otherwise must be
    /// null.
    TextureView textureView;
}

/// TODO
extern(C) struct BindGroupLayoutDescriptor {
    /// TODO
    StringView label;
    /// TODO
    const(BindGroupLayoutEntry)[] entries;
}

/// TODO
extern(C) struct BindGroupLayoutEntry {
    /// TODO
    uint binding;
    /// TODO
    ShaderStage visibility;
    /// If non-zero, this entry defines a binding array with this size.
    uint bindingArraySize;
    /// TODO
    BufferBindingLayout buffer;
    /// TODO
    SamplerBindingLayout sampler;
    /// TODO
    TextureBindingLayout texture;
    /// TODO
    StorageTextureBindingLayout storageTexture;
}

/// TODO
extern(C) struct BlendComponent {
    /// If set to @ref WGPUBlendOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBlendOperation_Add.
    BlendOperation operation;
    /// If set to @ref WGPUBlendFactor_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBlendFactor_One.
    BlendFactor srcFactor;
    /// If set to @ref WGPUBlendFactor_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBlendFactor_Zero.
    BlendFactor dstFactor;
}

/// TODO
extern(C) struct BlendState {
    /// TODO
    BlendComponent color;
    /// TODO
    BlendComponent alpha;
}

/// TODO
extern(C) struct BufferBindingLayout {
    /// If set to @ref WGPUBufferBindingType_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUBufferBindingType_Uniform.
    BufferBindingType type;
    /// TODO
    bool hasDynamicOffset;
    /// TODO
    ulong minBindingSize;
}

/// TODO
extern(C) struct BufferDescriptor {
    /// TODO
    StringView label;
    /// TODO
    BufferUsage usage;
    /// TODO
    ulong size;
    /// When true, the buffer is mapped in write mode at creation. It should
    /// thus be unmapped once its initial data has been written. @note Mapping
    /// at creation does **not** require the usage @ref
    /// WGPUBufferUsage_MapWrite.
    bool mappedAtCreation;
}

/// An RGBA color. Represents a `f32`, `i32`, or `u32` color using @ref
/// DoubleAsSupertype. If any channel is non-finite, produces a @ref
/// NonFiniteFloatValueError.
extern(C) struct Color {
    /// 
    double r;
    /// 
    double g;
    /// 
    double b;
    /// 
    double a;
}

/// TODO
extern(C) struct ColorTargetState {
    /// The texture format of the target. If @ref WGPUTextureFormat_Undefined,
    /// indicates a "hole" in the parent @ref WGPUFragmentState `targets` array:
    /// the pipeline does not output a value at this `location`.
    TextureFormat format;
    /// TODO
    BlendState blend;
    /// TODO
    ColorWriteMask writeMask;
}

/// TODO
extern(C) struct CommandBufferDescriptor {
    /// TODO
    StringView label;
}

/// TODO
extern(C) struct CommandEncoderDescriptor {
    /// TODO
    StringView label;
}

/// Note: While Compatibility Mode is optional to implement, this extension
/// struct is required to be supported (for both queries and requests) and
/// behave as defined in the WebGPU spec.
extern(C) struct CompatibilityModeLimits {
    /// TODO
    uint maxStorageBuffersInVertexStage;
    /// TODO
    uint maxStorageTexturesInVertexStage;
    /// TODO
    uint maxStorageBuffersInFragmentStage;
    /// TODO
    uint maxStorageTexturesInFragmentStage;
}

/// TODO
extern(C) struct CompilationInfo {
    /// TODO
    const(CompilationMessage)[] messages;
}

/// TODO
extern(C) struct CompilationMessage {
    /// A @ref LocalizableHumanReadableMessageString.
    StringView message;
    /// Severity level of the message.
    CompilationMessageType type;
    /// Line number where the message is attached, starting at 1.
    ulong lineNum;
    /// Offset in UTF-8 code units (bytes) from the beginning of the line,
    /// starting at 1.
    ulong linePos;
    /// Offset in UTF-8 code units (bytes) from the beginning of the shader
    /// code, starting at 0.
    ulong offset;
    /// Length in UTF-8 code units (bytes) of the span the message corresponds
    /// to.
    ulong length;
}

/// TODO
extern(C) struct ComputePassDescriptor {
    /// TODO
    StringView label;
    /// TODO
    PassTimestampWrites timestampWrites;
}

/// TODO
extern(C) struct ComputePipelineDescriptor {
    /// TODO
    StringView label;
    /// TODO
    PipelineLayout layout;
    /// TODO
    ComputeState compute;
}

/// TODO
extern(C) struct ComputeState {
    /// TODO
    ShaderModule module_;
    /// TODO
    StringView entryPoint;
    /// TODO
    const(ConstantEntry)[] constants;
}

/// TODO
extern(C) struct ConstantEntry {
    /// TODO
    StringView key;
    /// Represents a WGSL numeric or boolean value using @ref DoubleAsSupertype.
    /// If non-finite, produces a @ref NonFiniteFloatValueError.
    double value;
}

/// TODO
extern(C) struct DepthStencilState {
    /// TODO
    TextureFormat format;
    /// TODO
    OptionalBool depthWriteEnabled;
    /// TODO
    CompareFunction depthCompare;
    /// TODO
    StencilFaceState stencilFront;
    /// TODO
    StencilFaceState stencilBack;
    /// TODO
    uint stencilReadMask;
    /// TODO
    uint stencilWriteMask;
    /// TODO
    int depthBias;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float depthBiasSlopeScale;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float depthBiasClamp;
}

/// TODO
extern(C) struct DeviceDescriptor {
    /// TODO
    StringView label;
    /// TODO
    const(FeatureName)[] requiredFeatures;
    /// TODO
    Limits requiredLimits;
    /// TODO
    QueueDescriptor defaultQueue;
    /// TODO
    DeviceLost deviceLostCallbackInfo;
    /// Called when there is an uncaptured error on this device, from any
    /// thread. See @ref ErrorScopes. **Important:** This callback does not have
    /// a configurable @ref WGPUCallbackMode; it may be called at any time (like
    /// @ref WGPUCallbackMode_AllowSpontaneous). As such, calls into the
    /// `webgpu.h` API from this callback are unsafe. See @ref
    /// CallbackReentrancy.
    UncapturedError uncapturedErrorCallbackInfo;
}

/// TODO
extern(C) struct Extent3D {
    /// TODO
    uint width;
    /// TODO
    uint height;
    /// TODO
    uint depthOrArrayLayers;
}

/// Chained in an @ref WGPUBindGroupEntry to set it to an @ref
/// WGPUExternalTexture. This must have a corresponding @ref
/// WGPUExternalTextureBindingLayout in the @ref WGPUBindGroupLayout.
extern(C) struct ExternalTextureBindingEntry {
    /// TODO
    ExternalTexture externalTexture;
}

/// Chained in @ref WGPUBindGroupLayoutEntry to specify that the corresponding
/// entries in an @ref WGPUBindGroup will contain an @ref WGPUExternalTexture.
extern(C) struct ExternalTextureBindingLayout {
}

/// TODO
extern(C) struct FragmentState {
    /// TODO
    ShaderModule module_;
    /// TODO
    StringView entryPoint;
    /// TODO
    const(ConstantEntry)[] constants;
    /// TODO
    const(ColorTargetState)[] targets;
}

/// Opaque handle to an asynchronous operation. See @ref Asynchronous-Operations
/// for more information.
extern(C) struct Future {
    /// Opaque id of the @ref WGPUFuture
    ulong id;
}

/// Struct holding a future to wait on, and a `completed` boolean flag.
extern(C) struct FutureWaitInfo {
    /// The future to wait on.
    Future future;
    /// Whether or not the future completed.
    bool completed;
}

/// TODO
extern(C) struct InstanceDescriptor {
    /// TODO
    const(InstanceFeatureName)[] requiredFeatures;
    /// TODO
    InstanceLimits requiredLimits;
}

/// TODO
extern(C) struct InstanceLimits {
    /// The maximum number @ref WGPUFutureWaitInfo supported in a call to
    /// ::wgpuInstanceWaitAny with `timeoutNS \u003e 0`.
    size_t timedWaitAnyMaxCount;
}

/// TODO
extern(C) struct Limits {
    /// TODO
    uint maxTextureDimension1D;
    /// TODO
    uint maxTextureDimension2D;
    /// TODO
    uint maxTextureDimension3D;
    /// TODO
    uint maxTextureArrayLayers;
    /// TODO
    uint maxBindGroups;
    /// TODO
    uint maxBindGroupsPlusVertexBuffers;
    /// TODO
    uint maxBindingsPerBindGroup;
    /// TODO
    uint maxDynamicUniformBuffersPerPipelineLayout;
    /// TODO
    uint maxDynamicStorageBuffersPerPipelineLayout;
    /// TODO
    uint maxSampledTexturesPerShaderStage;
    /// TODO
    uint maxSamplersPerShaderStage;
    /// TODO
    uint maxStorageBuffersPerShaderStage;
    /// TODO
    uint maxStorageTexturesPerShaderStage;
    /// TODO
    uint maxUniformBuffersPerShaderStage;
    /// TODO
    ulong maxUniformBufferBindingSize;
    /// TODO
    ulong maxStorageBufferBindingSize;
    /// TODO
    uint minUniformBufferOffsetAlignment;
    /// TODO
    uint minStorageBufferOffsetAlignment;
    /// TODO
    uint maxVertexBuffers;
    /// TODO
    ulong maxBufferSize;
    /// TODO
    uint maxVertexAttributes;
    /// TODO
    uint maxVertexBufferArrayStride;
    /// TODO
    uint maxInterStageShaderVariables;
    /// TODO
    uint maxColorAttachments;
    /// TODO
    uint maxColorAttachmentBytesPerSample;
    /// TODO
    uint maxComputeWorkgroupStorageSize;
    /// TODO
    uint maxComputeInvocationsPerWorkgroup;
    /// TODO
    uint maxComputeWorkgroupSizeX;
    /// TODO
    uint maxComputeWorkgroupSizeY;
    /// TODO
    uint maxComputeWorkgroupSizeZ;
    /// TODO
    uint maxComputeWorkgroupsPerDimension;
    /// TODO
    uint maxImmediateSize;
}

/// TODO
extern(C) struct MultisampleState {
    /// TODO
    uint count;
    /// TODO
    uint mask;
    /// TODO
    bool alphaToCoverageEnabled;
}

/// TODO
extern(C) struct Origin3D {
    /// TODO
    uint x;
    /// TODO
    uint y;
    /// TODO
    uint z;
}

/// TODO
extern(C) struct PassTimestampWrites {
    /// Query set to write timestamps to.
    QuerySet querySet;
    /// TODO
    uint beginningOfPassWriteIndex;
    /// TODO
    uint endOfPassWriteIndex;
}

/// TODO
extern(C) struct PipelineLayoutDescriptor {
    /// TODO
    StringView label;
    /// TODO
    const(BindGroupLayout)[] bindGroupLayouts;
    /// TODO
    uint immediateSize;
}

/// TODO
extern(C) struct PrimitiveState {
    /// If set to @ref WGPUPrimitiveTopology_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUPrimitiveTopology_TriangleList.
    PrimitiveTopology topology;
    /// TODO
    IndexFormat stripIndexFormat;
    /// If set to @ref WGPUFrontFace_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFrontFace_CCW.
    FrontFace frontFace;
    /// If set to @ref WGPUCullMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUCullMode_None.
    CullMode cullMode;
    /// TODO
    bool unclippedDepth;
}

/// TODO
extern(C) struct QuerySetDescriptor {
    /// TODO
    StringView label;
    /// TODO
    QueryType type;
    /// TODO
    uint count;
}

/// TODO
extern(C) struct QueueDescriptor {
    /// TODO
    StringView label;
}

/// TODO
extern(C) struct RenderBundleDescriptor {
    /// TODO
    StringView label;
}

/// TODO
extern(C) struct RenderBundleEncoderDescriptor {
    /// TODO
    StringView label;
    /// TODO
    const(TextureFormat)[] colorFormats;
    /// TODO
    TextureFormat depthStencilFormat;
    /// TODO
    uint sampleCount;
    /// TODO
    bool depthReadOnly;
    /// TODO
    bool stencilReadOnly;
}

/// TODO
extern(C) struct RenderPassColorAttachment {
    /// If `NULL`, indicates a hole in the parent @ref
    /// WGPURenderPassDescriptor::colorAttachments array.
    TextureView view;
    /// TODO
    uint depthSlice;
    /// TODO
    TextureView resolveTarget;
    /// TODO
    LoadOp loadOp;
    /// TODO
    StoreOp storeOp;
    /// TODO
    Color clearValue;
}

/// TODO
extern(C) struct RenderPassDepthStencilAttachment {
    /// TODO
    TextureView view;
    /// TODO
    LoadOp depthLoadOp;
    /// TODO
    StoreOp depthStoreOp;
    /// This is a @ref NullableFloatingPointType. If `NaN`, indicates an
    /// `undefined` value (as defined by the JS spec). Use @ref
    /// WGPU_DEPTH_CLEAR_VALUE_UNDEFINED to indicate this semantically. If
    /// infinite, produces a @ref NonFiniteFloatValueError.
    float depthClearValue;
    /// TODO
    bool depthReadOnly;
    /// TODO
    LoadOp stencilLoadOp;
    /// TODO
    StoreOp stencilStoreOp;
    /// TODO
    uint stencilClearValue;
    /// TODO
    bool stencilReadOnly;
}

/// TODO
extern(C) struct RenderPassDescriptor {
    /// TODO
    StringView label;
    /// TODO
    const(RenderPassColorAttachment)[] colorAttachments;
    /// TODO
    RenderPassDepthStencilAttachment depthStencilAttachment;
    /// TODO
    QuerySet occlusionQuerySet;
    /// TODO
    PassTimestampWrites timestampWrites;
}

/// TODO
extern(C) struct RenderPassMaxDrawCount {
    /// TODO
    ulong maxDrawCount;
}

/// TODO
extern(C) struct RenderPipelineDescriptor {
    /// TODO
    StringView label;
    /// TODO
    PipelineLayout layout;
    /// TODO
    VertexState vertex;
    /// TODO
    PrimitiveState primitive;
    /// TODO
    DepthStencilState depthStencil;
    /// TODO
    MultisampleState multisample;
    /// TODO
    FragmentState fragment;
}

/// TODO
extern(C) struct RequestAdapterOptions {
    /// "Feature level" for the adapter request. If an adapter is returned, it
    /// must support the features and limits in the requested feature level. If
    /// set to @ref WGPUFeatureLevel_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFeatureLevel_Core. Additionally, implementations may ignore
    /// @ref WGPUFeatureLevel_Compatibility and provide @ref
    /// WGPUFeatureLevel_Core instead.
    FeatureLevel featureLevel;
    /// TODO
    PowerPreference powerPreference;
    /// If true, requires the adapter to be a "fallback" adapter as defined by
    /// the JS spec. If this is not possible, the request returns null.
    bool forceFallbackAdapter;
    /// If set, requires the adapter to have a particular backend type. If this
    /// is not possible, the request returns null.
    BackendType backendType;
    /// If set, requires the adapter to be able to output to a particular
    /// surface. If this is not possible, the request returns null.
    Surface compatibleSurface;
}

/// Extension providing requestAdapter options for implementations with WebXR
/// interop (i.e. Wasm).
extern(C) struct RequestAdapterWebXROptions {
    /// Sets the `xrCompatible` option in the JS API.
    bool xrCompatible;
}

/// TODO
extern(C) struct SamplerBindingLayout {
    /// If set to @ref WGPUSamplerBindingType_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUSamplerBindingType_Filtering.
    SamplerBindingType type;
}

/// TODO
extern(C) struct SamplerDescriptor {
    /// TODO
    StringView label;
    /// If set to @ref WGPUAddressMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUAddressMode_ClampToEdge.
    AddressMode addressModeU;
    /// If set to @ref WGPUAddressMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUAddressMode_ClampToEdge.
    AddressMode addressModeV;
    /// If set to @ref WGPUAddressMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUAddressMode_ClampToEdge.
    AddressMode addressModeW;
    /// If set to @ref WGPUFilterMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFilterMode_Nearest.
    FilterMode magFilter;
    /// If set to @ref WGPUFilterMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUFilterMode_Nearest.
    FilterMode minFilter;
    /// If set to @ref WGPUFilterMode_Undefined, [defaults](@ref SentinelValues)
    /// to @ref WGPUMipmapFilterMode_Nearest.
    MipmapFilterMode mipmapFilter;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float lodMinClamp;
    /// TODO If non-finite, produces a @ref NonFiniteFloatValueError.
    float lodMaxClamp;
    /// TODO
    CompareFunction compare;
    /// TODO
    ushort maxAnisotropy;
}

/// TODO
extern(C) struct ShaderModuleDescriptor {
    /// TODO
    StringView label;
}

/// TODO
extern(C) struct ShaderSourceSPIRV {
    /// TODO
    uint codeSize;
    /// TODO
    const(uint)* code;
}

/// TODO
extern(C) struct ShaderSourceWGSL {
    /// TODO
    StringView code;
}

/// TODO
extern(C) struct StencilFaceState {
    /// If set to @ref WGPUCompareFunction_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUCompareFunction_Always.
    CompareFunction compare;
    /// If set to @ref WGPUStencilOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStencilOperation_Keep.
    StencilOperation failOp;
    /// If set to @ref WGPUStencilOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStencilOperation_Keep.
    StencilOperation depthFailOp;
    /// If set to @ref WGPUStencilOperation_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStencilOperation_Keep.
    StencilOperation passOp;
}

/// TODO
extern(C) struct StorageTextureBindingLayout {
    /// If set to @ref WGPUStorageTextureAccess_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUStorageTextureAccess_WriteOnly.
    StorageTextureAccess access;
    /// TODO
    TextureFormat format;
    /// If set to @ref WGPUTextureViewDimension_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureViewDimension_2D.
    TextureViewDimension viewDimension;
}

/// TODO
extern(C) struct SupportedFeatures {
    /// TODO
    const(FeatureName)[] features;
}

/// TODO
extern(C) struct SupportedInstanceFeatures {
    /// TODO
    const(InstanceFeatureName)[] features;
}

/// TODO
extern(C) struct SupportedWGSLLanguageFeatures {
    /// TODO
    const(WGSLLanguageFeatureName)[] features;
}

/// Filled by @ref wgpuSurfaceGetCapabilities with what's supported for @ref
/// wgpuSurfaceConfigure for a pair of @ref WGPUSurface and @ref WGPUAdapter.
extern(C) struct SurfaceCapabilities {
    /// The bit set of supported @ref WGPUTextureUsage bits. Guaranteed to
    /// contain @ref WGPUTextureUsage_RenderAttachment.
    TextureUsage usages;
    /// A list of supported @ref WGPUTextureFormat values, in order of
    /// preference.
    const(TextureFormat)[] formats;
    /// A list of supported @ref WGPUPresentMode values. Guaranteed to contain
    /// @ref WGPUPresentMode_Fifo.
    const(PresentMode)[] presentModes;
    /// A list of supported @ref WGPUCompositeAlphaMode values. @ref
    /// WGPUCompositeAlphaMode_Auto will be an alias for the first element and
    /// will never be present in this array.
    const(CompositeAlphaMode)[] alphaModes;
}

/// Extension of @ref WGPUSurfaceConfiguration for color spaces and HDR.
extern(C) struct SurfaceColorManagement {
    /// TODO
    PredefinedColorSpace colorSpace;
    /// TODO
    ToneMappingMode toneMappingMode;
}

/// Options to @ref wgpuSurfaceConfigure for defining how a @ref WGPUSurface
/// will be rendered to and presented to the user. See @ref
/// Surface-Configuration for more details.
extern(C) struct SurfaceConfiguration {
    /// The @ref WGPUDevice to use to render to surface's textures.
    Device device;
    /// The @ref WGPUTextureFormat of the surface's textures.
    TextureFormat format;
    /// The @ref WGPUTextureUsage of the surface's textures.
    TextureUsage usage;
    /// The width of the surface's textures.
    uint width;
    /// The height of the surface's textures.
    uint height;
    /// The additional @ref WGPUTextureFormat for @ref WGPUTextureView format
    /// reinterpretation of the surface's textures.
    const(TextureFormat)[] viewFormats;
    /// How the surface's frames will be composited on the screen. If set to
    /// @ref WGPUCompositeAlphaMode_Auto, [defaults] to @ref
    /// WGPUCompositeAlphaMode_Inherit in native (allowing the mode to be
    /// configured externally), and to @ref WGPUCompositeAlphaMode_Opaque in
    /// Wasm.
    CompositeAlphaMode alphaMode;
    /// When and in which order the surface's frames will be shown on the
    /// screen. If set to @ref WGPUPresentMode_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUPresentMode_Fifo.
    PresentMode presentMode;
}

/// The root descriptor for the creation of an @ref WGPUSurface with @ref
/// wgpuInstanceCreateSurface. It isn't sufficient by itself and must have one
/// of the `WGPUSurfaceSource*` in its chain. See @ref Surface-Creation for more
/// details.
extern(C) struct SurfaceDescriptor {
    /// Label used to refer to the object.
    StringView label;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping
/// an Android
/// [`ANativeWindow`](https://developer.android.com/ndk/reference/group/a-native-window).
extern(C) struct SurfaceSourceAndroidNativeWindow {
    /// The pointer to the
    /// [`ANativeWindow`](https://developer.android.com/ndk/reference/group/a-native-window)
    /// that will be wrapped by the @ref WGPUSurface.
    void* window;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a
/// [`CAMetalLayer`](https://developer.apple.com/documentation/quartzcore/cametallayer?language=objc).
extern(C) struct SurfaceSourceMetalLayer {
    /// The pointer to the
    /// [`CAMetalLayer`](https://developer.apple.com/documentation/quartzcore/cametallayer?language=objc)
    /// that will be wrapped by the @ref WGPUSurface.
    void* layer;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a
/// [Wayland](https://wayland.freedesktop.org/)
/// [`wl_surface`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_surface).
extern(C) struct SurfaceSourceWaylandSurface {
    /// A
    /// [`wl_display`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_display)
    /// for this Wayland instance.
    void* display;
    /// A
    /// [`wl_surface`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_surface)
    /// that will be wrapped by the @ref WGPUSurface
    void* surface;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a
/// Windows
/// [`HWND`](https://learn.microsoft.com/en-us/windows/apps/develop/ui-input/retrieve-hwnd).
extern(C) struct SurfaceSourceWindowsHWND {
    /// The
    /// [`HINSTANCE`](https://learn.microsoft.com/en-us/windows/win32/learnwin32/winmain--the-application-entry-point)
    /// for this application. Most commonly `GetModuleHandle(nullptr)`.
    void* hinstance;
    /// The
    /// [`HWND`](https://learn.microsoft.com/en-us/windows/apps/develop/ui-input/retrieve-hwnd)
    /// that will be wrapped by the @ref WGPUSurface.
    void* hwnd;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping
/// an [XCB](https://xcb.freedesktop.org/) `xcb_window_t`.
extern(C) struct SurfaceSourceXCBWindow {
    /// The `xcb_connection_t` for the connection to the X server.
    void* connection;
    /// The `xcb_window_t` for the window that will be wrapped by the @ref
    /// WGPUSurface.
    uint window;
}

/// Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping
/// an [Xlib](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html)
/// `Window`.
extern(C) struct SurfaceSourceXlibWindow {
    /// A pointer to the
    /// [`Display`](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html#Opening_the_Display)
    /// connected to the X server.
    void* display;
    /// The
    /// [`Window`](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html#Creating_Windows)
    /// that will be wrapped by the @ref WGPUSurface.
    ulong window;
}

/// Queried each frame from a @ref WGPUSurface to get a @ref WGPUTexture to
/// render to along with some metadata. See @ref Surface-Presenting for more
/// details.
extern(C) struct SurfaceTexture {
    /// The @ref WGPUTexture representing the frame that will be shown on the
    /// surface. It is @ref ReturnedWithOwnership from @ref
    /// wgpuSurfaceGetCurrentTexture.
    Texture texture;
    /// Whether the call to @ref wgpuSurfaceGetCurrentTexture succeeded and a
    /// hint as to why it might not have.
    SurfaceGetCurrentTextureStatus status;
}

/// TODO
extern(C) struct TexelCopyBufferInfo {
    /// TODO
    TexelCopyBufferLayout layout;
    /// TODO
    Buffer buffer;
}

/// TODO
extern(C) struct TexelCopyBufferLayout {
    /// TODO
    ulong offset;
    /// TODO
    uint bytesPerRow;
    /// TODO
    uint rowsPerImage;
}

/// TODO
extern(C) struct TexelCopyTextureInfo {
    /// TODO
    Texture texture;
    /// TODO
    uint mipLevel;
    /// TODO
    Origin3D origin;
    /// If set to @ref WGPUTextureAspect_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureAspect_All.
    TextureAspect aspect;
}

/// TODO
extern(C) struct TextureBindingLayout {
    /// If set to @ref WGPUTextureSampleType_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureSampleType_Float.
    TextureSampleType sampleType;
    /// If set to @ref WGPUTextureViewDimension_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureViewDimension_2D.
    TextureViewDimension viewDimension;
    /// TODO
    bool multisampled;
}

/// Note: While Compatibility Mode is optional to implement, this extension
/// struct is required to be accepted (but per the WebGPU spec, its contents are
/// ignored on devices that have the @ref WGPUFeatureName_CoreFeaturesAndLimits
/// feature).
extern(C) struct TextureBindingViewDimension {
    /// TODO
    TextureViewDimension textureBindingViewDimension;
}

/// When accessed by a shader, the red/green/blue/alpha channels are replaced by
/// the value corresponding to the component specified in r, g, b, and a,
/// respectively unlike the JS API which uses a string of length four, with each
/// character mapping to the texture view's red/green/blue/alpha channels.
extern(C) struct TextureComponentSwizzle {
    /// The value that replaces the red channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_R.
    ComponentSwizzle r;
    /// The value that replaces the green channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_G.
    ComponentSwizzle g;
    /// The value that replaces the blue channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_B.
    ComponentSwizzle b;
    /// The value that replaces the alpha channel in the shader. If set to @ref
    /// WGPUComponentSwizzle_Undefined, [defaults](@ref SentinelValues) to @ref
    /// WGPUComponentSwizzle_A.
    ComponentSwizzle a;
}

/// TODO
extern(C) struct TextureComponentSwizzleDescriptor {
    /// TODO
    TextureComponentSwizzle swizzle;
}

/// TODO
extern(C) struct TextureDescriptor {
    /// TODO
    StringView label;
    /// TODO
    TextureUsage usage;
    /// If set to @ref WGPUTextureDimension_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureDimension_2D.
    TextureDimension dimension;
    /// TODO
    Extent3D size;
    /// TODO
    TextureFormat format;
    /// TODO
    uint mipLevelCount;
    /// TODO
    uint sampleCount;
    /// TODO
    const(TextureFormat)[] viewFormats;
}

/// TODO
extern(C) struct TextureViewDescriptor {
    /// TODO
    StringView label;
    /// TODO
    TextureFormat format;
    /// TODO
    TextureViewDimension dimension;
    /// TODO
    uint baseMipLevel;
    /// TODO
    uint mipLevelCount;
    /// TODO
    uint baseArrayLayer;
    /// TODO
    uint arrayLayerCount;
    /// If set to @ref WGPUTextureAspect_Undefined, [defaults](@ref
    /// SentinelValues) to @ref WGPUTextureAspect_All.
    TextureAspect aspect;
    /// TODO
    TextureUsage usage;
}

/// TODO
extern(C) struct VertexAttribute {
    /// TODO
    VertexFormat format;
    /// TODO
    ulong offset;
    /// TODO
    uint shaderLocation;
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
extern(C) struct VertexBufferLayout {
    /// TODO
    VertexStepMode stepMode;
    /// TODO
    ulong arrayStride;
    /// TODO
    const(VertexAttribute)[] attributes;
}

/// TODO
extern(C) struct VertexState {
    /// TODO
    ShaderModule module_;
    /// TODO
    StringView entryPoint;
    /// TODO
    const(ConstantEntry)[] constants;
    /// TODO
    const(VertexBufferLayout)[] buffers;
}


struct Adapter {}
struct BindGroup {}
struct BindGroupLayout {}
struct Buffer {}
struct CommandBuffer {}
struct CommandEncoder {}
struct ComputePassEncoder {}
struct ComputePipeline {}
struct Device {}
struct ExternalTexture {}
struct Instance {}
struct PipelineLayout {}
struct QuerySet {}
struct Queue {}
struct RenderBundle {}
struct RenderBundleEncoder {}
struct RenderPassEncoder {}
struct RenderPipeline {}
struct Sampler {}
struct ShaderModule {}
struct Surface {}
struct Texture {}
struct TextureView {}
