module webgpu.webgpu;

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
    /// \"Compatibility\" profile which can be supported on OpenGL ES 3.1 and
    /// D3D11.
    compatibility = 1,
    /// \"Core\" profile which can be supported on Vulkan/Metal/D3D12 (at
    /// least).
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


struct BufferUsage {}
struct ColorWriteMask {}
struct MapMode {}
struct ShaderStage {}
struct TextureUsage {}

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

struct AdapterInfo {}
struct BindGroupDescriptor {}
struct BindGroupEntry {}
struct BindGroupLayoutDescriptor {}
struct BindGroupLayoutEntry {}
struct BlendComponent {}
struct BlendState {}
struct BufferBindingLayout {}
struct BufferDescriptor {}
struct Color {}
struct ColorTargetState {}
struct CommandBufferDescriptor {}
struct CommandEncoderDescriptor {}
struct CompatibilityModeLimits {}
struct CompilationInfo {}
struct CompilationMessage {}
struct ComputePassDescriptor {}
struct ComputePipelineDescriptor {}
struct ComputeState {}
struct ConstantEntry {}
struct DepthStencilState {}
struct DeviceDescriptor {}
struct Extent3D {}
struct ExternalTextureBindingEntry {}
struct ExternalTextureBindingLayout {}
struct FragmentState {}
struct Future {}
struct FutureWaitInfo {}
struct InstanceDescriptor {}
struct InstanceLimits {}
struct Limits {}
struct MultisampleState {}
struct Origin3D {}
struct PassTimestampWrites {}
struct PipelineLayoutDescriptor {}
struct PrimitiveState {}
struct QuerySetDescriptor {}
struct QueueDescriptor {}
struct RenderBundleDescriptor {}
struct RenderBundleEncoderDescriptor {}
struct RenderPassColorAttachment {}
struct RenderPassDepthStencilAttachment {}
struct RenderPassDescriptor {}
struct RenderPassMaxDrawCount {}
struct RenderPipelineDescriptor {}
struct RequestAdapterOptions {}
struct RequestAdapterWebXROptions {}
struct SamplerBindingLayout {}
struct SamplerDescriptor {}
struct ShaderModuleDescriptor {}
struct ShaderSourceSPIRV {}
struct ShaderSourceWGSL {}
struct StencilFaceState {}
struct StorageTextureBindingLayout {}
struct SupportedFeatures {}
struct SupportedInstanceFeatures {}
struct SupportedWGSLLanguageFeatures {}
struct SurfaceCapabilities {}
struct SurfaceColorManagement {}
struct SurfaceConfiguration {}
struct SurfaceDescriptor {}
struct SurfaceSourceAndroidNativeWindow {}
struct SurfaceSourceMetalLayer {}
struct SurfaceSourceWaylandSurface {}
struct SurfaceSourceWindowsHWND {}
struct SurfaceSourceXCBWindow {}
struct SurfaceSourceXlibWindow {}
struct SurfaceTexture {}
struct TexelCopyBufferInfo {}
struct TexelCopyBufferLayout {}
struct TexelCopyTextureInfo {}
struct TextureBindingLayout {}
struct TextureBindingViewDimension {}
struct TextureComponentSwizzle {}
struct TextureComponentSwizzleDescriptor {}
struct TextureDescriptor {}
struct TextureViewDescriptor {}
struct VertexAttribute {}
struct VertexBufferLayout {}
struct VertexState {}

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
