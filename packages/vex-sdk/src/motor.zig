const device = @import("device.zig");
const V5_DeviceT = device.V5_DeviceT;

pub const V5MotorBrakeMode = enum(u8) {
    kV5MotorBrakeModeCoast = 0,
    kV5MotorBrakeModeBrake = 1,
    kV5MotorBrakeModeHold = 2,
};

pub const V5MotorControlMode = enum(u8) {
    kMotorControlModeOFF = 0,
    kMotorControlModeBRAKE = 1,
    kMotorControlModeHOLD = 2,
    kMotorControlModeSERVO = 3,
    kMotorControlModePROFILE = 4,
    kMotorControlModeVELOCITY = 5,
    kMotorControlModeUNDEFINED = 6,
};

pub const V5MotorEncoderUnits = enum(u8) {
    kMotorEncoderDegrees = 0,
    kMotorEncoderRotations = 1,
    kMotorEncoderCounts = 2,
};

pub const V5MotorGearset = enum(u8) {
    kMotorGearSet_36 = 0,
    kMotorGearSet_18 = 1,
    kMotorGearSet_06 = 2,
};

pub const V5_DeviceMotorPid = extern struct {
    kf: u8,
    kp: u8,
    ki: u8,
    kd: u8,
    filter: u8,
    pad1: u8,
    limit: u16,
    threshold: u8,
    loopspeed: u8,
    pad2: [2]u8,
};

pub extern fn vexDeviceMotorVelocitySet(device: V5_DeviceT, velocity: i32) void;
pub extern fn vexDeviceMotorVelocityGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorActualVelocityGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorDirectionGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorModeSet(device: V5_DeviceT, mode: V5MotorControlMode) void;
pub extern fn vexDeviceMotorModeGet(device: V5_DeviceT) V5MotorControlMode;
pub extern fn vexDeviceMotorPwmSet(device: V5_DeviceT, pwm: i32) void;
pub extern fn vexDeviceMotorPwmGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorCurrentLimitSet(device: V5_DeviceT, limit: i32) void;
pub extern fn vexDeviceMotorCurrentLimitGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorCurrentGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorPowerGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorTorqueGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorEfficiencyGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorTemperatureGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorOverTempFlagGet(device: V5_DeviceT) bool;
pub extern fn vexDeviceMotorCurrentLimitFlagGet(device: V5_DeviceT) bool;
pub extern fn vexDeviceMotorZeroVelocityFlagGet(device: V5_DeviceT) bool;
pub extern fn vexDeviceMotorZeroPositionFlagGet(device: V5_DeviceT) bool;
pub extern fn vexDeviceMotorReverseFlagSet(device: V5_DeviceT, reverse: bool) void;
pub extern fn vexDeviceMotorReverseFlagGet(device: V5_DeviceT) bool;
pub extern fn vexDeviceMotorEncoderUnitsSet(device: V5_DeviceT, units: V5MotorEncoderUnits) void;
pub extern fn vexDeviceMotorEncoderUnitsGet(device: V5_DeviceT) V5MotorEncoderUnits;
pub extern fn vexDeviceMotorBrakeModeSet(device: V5_DeviceT, mode: V5MotorBrakeMode) void;
pub extern fn vexDeviceMotorBrakeModeGet(device: V5_DeviceT) V5MotorBrakeMode;
pub extern fn vexDeviceMotorPositionSet(device: V5_DeviceT, position: f64) void;
pub extern fn vexDeviceMotorPositionGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorPositionRawGet(device: V5_DeviceT, timestamp: *u32) i32;
pub extern fn vexDeviceMotorPositionReset(device: V5_DeviceT) void;
pub extern fn vexDeviceMotorTargetGet(device: V5_DeviceT) f64;
pub extern fn vexDeviceMotorServoTargetSet(device: V5_DeviceT, position: f64) void;
pub extern fn vexDeviceMotorAbsoluteTargetSet(device: V5_DeviceT, position: f64, velocity: i32) void;
pub extern fn vexDeviceMotorRelativeTargetSet(device: V5_DeviceT, position: f64, velocity: i32) void;
pub extern fn vexDeviceMotorFaultsGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceMotorFlagsGet(device: V5_DeviceT) u32;
pub extern fn vexDeviceMotorVoltageSet(device: V5_DeviceT, voltage: i32) void;
pub extern fn vexDeviceMotorVoltageGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorGearingSet(device: V5_DeviceT, gearset: V5MotorGearset) void;
pub extern fn vexDeviceMotorGearingGet(device: V5_DeviceT) V5MotorGearset;
pub extern fn vexDeviceMotorVoltageLimitSet(device: V5_DeviceT, limit: i32) void;
pub extern fn vexDeviceMotorVoltageLimitGet(device: V5_DeviceT) i32;
pub extern fn vexDeviceMotorVelocityUpdate(device: V5_DeviceT, velocity: i32) void;
pub extern fn vexDeviceMotorPositionPidSet(device: V5_DeviceT, pid: *V5_DeviceMotorPid) void;
pub extern fn vexDeviceMotorVelocityPidSet(device: V5_DeviceT, pid: *V5_DeviceMotorPid) void;
pub extern fn vexDeviceMotorExternalProfileSet(device: V5_DeviceT, position: f64, velocity: i32) void;
