pub const V5_DeviceT = ?*anyopaque;
pub const V5_Device = ?*anyopaque;

pub const V5_MAX_DEVICE_PORTS: usize = 32;

pub const V5_DeviceType = enum(u8) {
    kDeviceTypeNoSensor = 0,
    kDeviceTypeMotorSensor = 2,
    kDeviceTypeLedSensor = 3,
    kDeviceTypeAbsEncSensor = 4,
    kDeviceTypeCrMotorSensor = 5,
    kDeviceTypeImuSensor = 6,
    kDeviceTypeDistanceSensor = 7,
    kDeviceTypeRadioSensor = 8,
    kDeviceTypeTetherSensor = 9,
    kDeviceTypeBrainSensor = 10,
    kDeviceTypeVisionSensor = 11,
    kDeviceTypeAdiSensor = 12,
    kDeviceTypeRes1Sensor = 13,
    kDeviceTypeRes2Sensor = 14,
    kDeviceTypeRes3Sensor = 15,
    kDeviceTypeOpticalSensor = 16,
    kDeviceTypeMagnetSensor = 17,
    kDeviceTypeGpsSensor = 20,
    kDeviceTypeAicameraSensor = 26,
    kDeviceTypeLightTowerSensor = 27,
    kDeviceTypeArmDevice = 28,
    kDeviceTypeAiVisionSensor = 29,
    kDeviceTypePneumaticSensor = 30,
    kDeviceTypeBumperSensor = 0x40,
    kDeviceTypeGyroSensor = 0x46,
    kDeviceTypeSonarSensor = 0x47,
    kDeviceTypeGenericSensor = 128,
    kDeviceTypeGenericSerial = 129,
    kDeviceTypeUndefinedSensor = 255,
};

extern fn jumpTableCall(offset: usize) callconv(.C) void;

pub extern fn vexDevicesGetNumber() u32;
pub extern fn vexDevicesGetNumberByType(device_type: V5_DeviceType) u32;
pub extern fn vexDevicesGet() V5_DeviceT;
pub extern fn vexDeviceGetByIndex(index: u32) V5_DeviceT;
pub extern fn vexDeviceGetStatus(devices: [*]V5_DeviceType) i32;
pub extern fn vexDeviceGetTimestamp(device: V5_DeviceT) u32;
pub extern fn vexDeviceGenericValueGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceButtonStateGet() c_int;
