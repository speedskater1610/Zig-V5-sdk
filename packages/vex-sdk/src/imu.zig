const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub const V5_DeviceImuRaw = extern struct {
    x: f64,
    y: f64,
    z: f64,
    w: f64,
};

pub const V5_DeviceImuQuaternion = extern struct {
    a: f64,
    b: f64,
    c: f64,
    d: f64,
};

pub const V5ImuOrientationMode = enum(u8) {
    kImuOrientationZUp = 0x00,
    kImuOrientationZDown = 0x10,
    kImuOrientationXUp = 0x20,
    kImuOrientationXDown = 0x30,
    kImuOrientationYUp = 0x40,
    kImuOrientationYDown = 0x50,
    kImuOrientationAuto = 0x80,
};

pub const V5_DeviceImuAttitude = extern struct {
    pitch: f64,
    roll: f64,
    yaw: f64,
};

pub extern fn vexDeviceImuReset(device: V5_DeviceT) void;
pub extern fn vexDeviceImuHeadingGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceImuDegreesGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceImuQuaternionGet(device: V5_DeviceT, data: *V5_DeviceImuQuaternion) void;
pub extern fn vexDeviceImuAttitudeGet(device: V5_DeviceT, data: *V5_DeviceImuAttitude) void;
pub extern fn vexDeviceImuRawGyroGet(device: V5_DeviceT, data: *V5_DeviceImuRaw) void;
pub extern fn vexDeviceImuRawAccelGet(device: V5_DeviceT, data: *V5_DeviceImuRaw) void;
pub extern fn vexDeviceImuStatusGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceImuModeSet(device: V5_DeviceT, mode: u32) void;
pub extern fn vexDeviceImuModeGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceImuDataRateSet(device: V5_DeviceT, rate: u32) void;
