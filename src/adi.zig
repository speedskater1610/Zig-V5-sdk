const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub const V5_AdiPortConfiguration = enum(u8) {
    kAdiPortTypeAnalogIn = 0,
    kAdiPortTypeAnalogOut = 1,
    kAdiPortTypeDigitalIn = 2,
    kAdiPortTypeDigitalOut = 3,
    kAdiPortTypeSmartButton = 4,
    kAdiPortTypeSmartPot = 5,
    kAdiPortTypeLegacyButton = 6,
    kAdiPortTypeLegacyPotentiometer = 7,
    kAdiPortTypeLegacyLineSensor = 8,
    kAdiPortTypeLegacyLightSensor = 9,
    kAdiPortTypeLegacyGyro = 10,
    kAdiPortTypeLegacyAccelerometer = 11,
    kAdiPortTypeLegacyServo = 12,
    kAdiPortTypeLegacyPwm = 13,
    kAdiPortTypeQuadEncoder = 14,
    kAdiPortTypeSonar = 15,
    kAdiPortTypeLegacyPwmSlew = 16,
    kAdiPortTypeUndefined = 255,
};

pub const V5_DeviceBumperState = enum(u8) {
    kBumperReleased = 0,
    kBumperPressed = 1,
};

pub extern fn vexDeviceAdiPortConfigSet(device: V5_DeviceT, port: u32, config: V5_AdiPortConfiguration) void;
pub extern fn vexDeviceAdiPortConfigGet(device: V5_DeviceT, port: u32) V5_AdiPortConfiguration;
pub extern fn vexDeviceAdiValueSet(device: V5_DeviceT, port: u32, value: i32) void;
pub extern fn vexDeviceAdiValueGet(device: V5_DeviceT, port: u32) i32;
pub extern fn vexDeviceAdiAddrLedSet(device: V5_DeviceT, port: u32, pData: [*]u32, nOffset: u32, nLength: u32, options: u32) void;
pub extern fn vexDeviceBumperGet(device: V5_DeviceT) V5_DeviceBumperState;
pub extern fn vexDeviceGyroReset(device: V5_DeviceT) void;
pub extern fn vexDeviceGyroHeadingGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceGyroDegreesGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceSonarValueGet(device: V5_DeviceT) i32;
