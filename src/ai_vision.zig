const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub const V5_DeviceAiVisionColor = extern struct {
    id: u8,
    red: u8,
    grn: u8,
    blu: u8,
    hangle: f32,
    hdsat: f32,
    reserved: u32,
};

pub const V5_DeviceAiVisionColorData = extern struct {
    xoffset: u16,
    yoffset: u16,
    width: u16,
    height: u16,
    angle: u16,
};

pub const V5_DeviceAiVisionTagData = extern struct {
    x0: i16,
    y0: i16,
    x1: i16,
    y1: i16,
    x2: i16,
    y2: i16,
    x3: i16,
    y3: i16,
};

pub const V5_DeviceAiVisionModelData = extern struct {
    xoffset: u16,
    yoffset: u16,
    width: u16,
    height: u16,
    score: u16,
};

pub const V5_DeviceAiVisionObjectData = extern union {
    color: V5_DeviceAiVisionColorData,
    tag: V5_DeviceAiVisionTagData,
    model: V5_DeviceAiVisionModelData,
};

pub const V5_DeviceAiVisionObject = extern struct {
    id: u8,
    type: u8,
    object: V5_DeviceAiVisionObjectData,
};

pub const V5_DeviceAiVisionCode = extern struct {
    id: u8,
    len: u8,
    c1: i16,
    c2: i16,
    c3: i16,
    c4: i16,
    c5: i16,
    c6: i16,
    c7: i16,
};

pub extern fn vexDeviceAiVisionClassNameGet(device: V5_DeviceT, id: i32, pName: [*]u8) i32;
pub extern fn vexDeviceAiVisionCodeGet(device: V5_DeviceT, id: u32, pCode: *V5_DeviceAiVisionCode) bool;
pub extern fn vexDeviceAiVisionCodeSet(device: V5_DeviceT, pCode: *V5_DeviceAiVisionCode) void;
pub extern fn vexDeviceAiVisionColorGet(device: V5_DeviceT, id: u32, pColor: *V5_DeviceAiVisionColor) bool;
pub extern fn vexDeviceAiVisionColorSet(device: V5_DeviceT, pColor: *V5_DeviceAiVisionColor) void;
pub extern fn vexDeviceAiVisionModeGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceAiVisionModeSet(device: V5_DeviceT, mode: u32) void;
pub extern fn vexDeviceAiVisionObjectCountGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceAiVisionObjectGet(device: V5_DeviceT, indexObj: u32, pObject: *V5_DeviceAiVisionObject) i32;
pub extern fn vexDeviceAiVisionSensorSet(device: V5_DeviceT, brightness: f64, contrast: f64) void;
pub extern fn vexDeviceAiVisionStatusGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceAiVisionTemperatureGet(device: V5_DeviceT) f64;
