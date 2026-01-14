const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub extern fn vexDeviceGenericRadioConnection(device: V5_DeviceT, link_id: [*]u8, type_: c_int, ov: bool) void;
pub extern fn vexDeviceGenericRadioWriteFree(device: V5_DeviceT) i32;
pub extern fn vexDeviceGenericRadioTransmit(device: V5_DeviceT, data: [*]const u8, size: u16) i32;
pub extern fn vexDeviceGenericRadioReceiveAvail(device: V5_DeviceT) i32;
pub extern fn vexDeviceGenericRadioReceive(device: V5_DeviceT, data: [*]u8, size: u16) i32;
pub extern fn vexDeviceGenericRadioLinkStatus(device: V5_DeviceT) bool;
