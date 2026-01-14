pub const V5_DeviceOpticalRaw = extern struct {
    clear: u16,
    red: u16,
    green: u16,
    blue: u16,
};

pub const V5_DeviceOpticalRgb = extern struct {
    red: f64,
    green: f64,
    blue: f64,
    brightness: f64,
};

pub const V5_DeviceOpticalGesture = extern struct {
    udata: u8,
    ddata: u8,
    ldata: u8,
    rdata: u8,
    gesture_type: u8,
    padding: u8,
    count: u16,
    time: u32,
};

pub extern fn vexDeviceOpticalHueGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceOpticalSatGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceOpticalBrightnessGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceOpticalProximityGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceOpticalRgbGet(device: V5_DeviceT, data: *V5_DeviceOpticalRgb) void;
pub extern fn vexDeviceOpticalLedPwmSet(device: V5_DeviceT, value: i32) void;
pub extern fn vexDeviceOpticalLedPwmGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceOpticalStatusGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceOpticalRawGet(device: V5_DeviceT, data: *V5_DeviceOpticalRaw) void;
pub extern fn vexDeviceOpticalModeSet(device: V5_DeviceT, mode: u32) void;
pub extern fn vexDeviceOpticalModeGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceOpticalGestureGet(device: V5_DeviceT, pData: *V5_DeviceOpticalGesture) u32;
pub extern fn vexDeviceOpticalGestureEnable(device: V5_DeviceT) void;
pub extern fn vexDeviceOpticalGestureDisable(device: V5_DeviceT) void;
pub extern fn vexDeviceOpticalProximityThreshold(device: V5_DeviceT, value: i32) void;
pub extern fn vexDeviceOpticalIntegrationTimeSet(device: V5_DeviceT, timeMs: f64) void;
pub extern fn vexDeviceOpticalIntegrationTimeGet(device: V5_DeviceT) f64;
