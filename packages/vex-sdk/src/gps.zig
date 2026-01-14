const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub const V5_DeviceGpsRaw = extern struct {
    x: f64,
    y: f64,
    z: f64,
    w: f64,
};

pub const V5_DeviceGpsAttitude = extern struct {
    pitch: f64,
    roll: f64,
    yaw: f64,
    position_x: f64,
    position_y: f64,
    position_z: f64,
    az: f64,
    el: f64,
    rot: f64,
};

pub const V5_DeviceGpsQuaternion = extern struct {
    x: f64,
    y: f64,
    z: f64,
    w: f64,
};

pub extern fn vexDeviceGpsReset(device: V5_DeviceT) void;
pub extern fn vexDeviceGpsHeadingGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceGpsDegreesGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceGpsQuaternionGet(device: V5_DeviceT, data: *V5_DeviceGpsQuaternion) void;
pub extern fn vexDeviceGpsAttitudeGet(device: V5_DeviceT, data: *V5_DeviceGpsAttitude, bRaw: bool) void;
pub extern fn vexDeviceGpsRawGyroGet(device: V5_DeviceT, data: *V5_DeviceGpsRaw) void;
pub extern fn vexDeviceGpsRawAccelGet(device: V5_DeviceT, data: *V5_DeviceGpsRaw) void;
pub extern fn vexDeviceGpsStatusGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceGpsModeSet(device: V5_DeviceT, mode: u32) void;
pub extern fn vexDeviceGpsModeGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceGpsDataRateSet(device: V5_DeviceT, rate: u32) void;
pub extern fn vexDeviceGpsOriginSet(device: V5_DeviceT, ox: f64, oy: f64) void;
pub extern fn vexDeviceGpsOriginGet(device: V5_DeviceT, ox: *f64, oy: *f64) void;
pub extern fn vexDeviceGpsRotationSet(device: V5_DeviceT, value: f64) void;
pub extern fn vexDeviceGpsRotationGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceGpsInitialPositionSet(device: V5_DeviceT, initial_x: f64, initial_y: f64, initial_rotation: f64) void;
pub extern fn vexDeviceGpsErrorGet(device: V5_DeviceT) f64;
