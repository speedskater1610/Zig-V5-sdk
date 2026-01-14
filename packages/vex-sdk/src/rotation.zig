const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub extern fn vexDeviceAbsEncReset(device: V5_DeviceT) void;
pub extern fn vexDeviceAbsEncPositionSet(device: V5_DeviceT, position: i32) void;
pub extern fn vexDeviceAbsEncPositionGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceAbsEncVelocityGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceAbsEncAngleGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceAbsEncReverseFlagSet(device: V5_DeviceT, value: bool) void;
pub extern fn vexDeviceAbsEncReverseFlagGet(device: V5_DeviceT) bool;
pub extern fn vexDeviceAbsEncStatusGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceAbsEncDataRateSet(device: V5_DeviceT, rate: u32) void;
