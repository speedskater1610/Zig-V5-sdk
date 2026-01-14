const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub extern fn vexDeviceGenericSerialEnable(device: V5_DeviceT, options: i32) void;
pub extern fn vexDeviceGenericSerialBaudrate(device: V5_DeviceT, baudrate: i32) void;
pub extern fn vexDeviceGenericSerialWriteChar(device: V5_DeviceT, c: u8) i32;
pub extern fn vexDeviceGenericSerialWriteFree(device: V5_DeviceT) i32;
pub extern fn vexDeviceGenericSerialTransmit(device: V5_DeviceT, buffer: [*]const u8, length: i32) i32;
pub extern fn vexDeviceGenericSerialReadChar(device: V5_DeviceT) i32;
pub extern fn vexDeviceGenericSerialPeekChar(device: V5_DeviceT) i32;
pub extern fn vexDeviceGenericSerialReceiveAvail(device: V5_DeviceT) i32;
pub extern fn vexDeviceGenericSerialReceive(device: V5_DeviceT, buffer: [*]u8, length: i32) i32;
pub extern fn vexDeviceGenericSerialFlush(device: V5_DeviceT) void;

pub extern fn vexSerialWriteChar(channel: u32, c: u8) i32;
pub extern fn vexSerialWriteBuffer(channel: u32, data: [*]const u8, data_len: u32) i32;
pub extern fn vexSerialReadChar(channel: u32) i32;
pub extern fn vexSerialPeekChar(channel: u32) i32;
pub extern fn vexSerialWriteFree(channel: u32) i32;
