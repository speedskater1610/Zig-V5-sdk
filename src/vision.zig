const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub const V5VisionMode = enum(u8) {
    kVisionModeNormal = 0,
    kVisionModeMixed = 1,
    kVisionModeLineDetect = 2,
    kVisionTypeTest = 3,
};

pub const V5VisionBlockType = enum(u8) {
    kVisionTypeNormal = 0,
    kVisionTypeColorCode = 1,
    kVisionTypeLineDetect = 2,
};

pub const V5_DeviceVisionObject = extern struct {
    signature: u16,
    type: V5VisionBlockType,
    xoffset: u16,
    yoffset: u16,
    width: u16,
    height: u16,
    angle: u16,
};

pub const V5_DeviceVisionSignature = extern struct {
    id: u8,
    flags: u8,
    pad: [2]u8,
    range: f32,
    uMin: i32,
    uMax: i32,
    uMean: i32,
    vMin: i32,
    vMax: i32,
    vMean: i32,
    mRgb: u32,
    mType: u32,
};

pub const V5VisionWBMode = enum(u8) {
    kVisionWBNormal = 0,
    kVisionWBStart = 1,
    kVisionWBManual = 2,
};

pub const V5_DeviceVisionRgb = extern struct {
    red: u8,
    green: u8,
    blue: u8,
    brightness: u8,
};

pub const V5VisionLedMode = enum(u8) {
    kVisionLedModeAuto = 0,
    kVisionLedModeManual = 1,
};

pub const V5VisionWifiMode = enum(u8) {
    kVisionWifiModeOff = 0,
    kVisionWifiModeOn = 1,
};

pub extern fn vexDeviceVisionModeSet(device: V5_DeviceT, mode: V5VisionMode) void;
pub extern fn vexDeviceVisionModeGet(device: V5_DeviceT) V5VisionMode;
pub extern fn vexDeviceVisionObjectCountGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceVisionObjectGet(device: V5_DeviceT, index: u32, object: *V5_DeviceVisionObject) i32;
pub extern fn vexDeviceVisionSignatureSet(device: V5_DeviceT, signature: *V5_DeviceVisionSignature) void;
pub extern fn vexDeviceVisionSignatureGet(device: V5_DeviceT, id: u32, signature: *V5_DeviceVisionSignature) bool;
pub extern fn vexDeviceVisionBrightnessSet(device: V5_DeviceT, percent: u8) void;
pub extern fn vexDeviceVisionBrightnessGet(device: V5_DeviceT) u8;
pub extern fn vexDeviceVisionWhiteBalanceModeSet(device: V5_DeviceT, mode: V5VisionWBMode) void;
pub extern fn vexDeviceVisionWhiteBalanceModeGet(device: V5_DeviceT) V5VisionWBMode;
pub extern fn vexDeviceVisionWhiteBalanceSet(device: V5_DeviceT, color: V5_DeviceVisionRgb) void;
pub extern fn vexDeviceVisionWhiteBalanceGet(device: V5_DeviceT) V5_DeviceVisionRgb;
pub extern fn vexDeviceVisionLedModeSet(device: V5_DeviceT, mode: V5VisionLedMode) void;
pub extern fn vexDeviceVisionLedModeGet(device: V5_DeviceT) V5VisionLedMode;
pub extern fn vexDeviceVisionLedBrigntnessSet(device: V5_DeviceT, percent: u8) void;
pub extern fn vexDeviceVisionLedBrigntnessGet(device: V5_DeviceT) u8;
pub extern fn vexDeviceVisionLedColorSet(device: V5_DeviceT, color: V5_DeviceVisionRgb) void;
pub extern fn vexDeviceVisionLedColorGet(device: V5_DeviceT) V5_DeviceVisionRgb;
pub extern fn vexDeviceVisionWifiModeSet(device: V5_DeviceT, mode: V5VisionWifiMode) void;
pub extern fn vexDeviceVisionWifiModeGet(device: V5_DeviceT) V5VisionWifiMode;
