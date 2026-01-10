const std = @import("std");
const vex = @import("vex-sdk");

// Motor port configuration
const LEFT_MOTOR_PORT: u32 = 1;
const RIGHT_MOTOR_PORT: u32 = 10;

// Controller configuration
const CONTROLLER_ID = vex.controller.V5_ControllerId.kControllerMaster;

// Deadband to prevent drift from stick noise
const DEADBAND: i32 = 5;

// Global variables for motors
var left_motor: vex.device.V5_DeviceT = null;
var right_motor: vex.device.V5_DeviceT = null;

/// Apply deadband to controller input
fn applyDeadband(value: i32) i32 {
    if (@abs(value) < DEADBAND) {
        return 0;
    }
    return value;
}

/// Initialize the motors
fn initMotors() void {
    // Get motor devices
    left_motor = vex.device.vexDeviceGetByIndex(LEFT_MOTOR_PORT);
    right_motor = vex.device.vexDeviceGetByIndex(RIGHT_MOTOR_PORT);

    // Configure motors
    vex.motor.vexDeviceMotorBrakeModeSet(left_motor, .kV5MotorBrakeModeCoast);
    vex.motor.vexDeviceMotorBrakeModeSet(right_motor, .kV5MotorBrakeModeCoast);

    // Set motor gearing (adjust based on your robot)
    vex.motor.vexDeviceMotorGearingSet(left_motor, .kMotorGearSet_18);
    vex.motor.vexDeviceMotorGearingSet(right_motor, .kMotorGearSet_18);

    // Reverse right motor if needed (depends on your robot's configuration)
    vex.motor.vexDeviceMotorReverseFlagSet(right_motor, true);
}

/// Tank drive control - left stick controls left side, right stick controls right side
fn tankDrive() void {
    // Get controller axis values
    const left_y = vex.controller.vexControllerGet(CONTROLLER_ID, .Axis3 // Left joystick Y axis
    );

    const right_y = vex.controller.vexControllerGet(CONTROLLER_ID, .Axis2 // Right joystick Y axis
    );

    // Apply deadband
    const left_power = applyDeadband(left_y);
    const right_power = applyDeadband(right_y);

    // Set motor velocities (range: -100 to 100)
    vex.motor.vexDeviceMotorVelocitySet(left_motor, left_power);
    vex.motor.vexDeviceMotorVelocitySet(right_motor, right_power);
}

/// Display robot info on the brain screen
fn displayInfo() void {
    // Clear screen
    vex.display.vexDisplayForegroundColor(0xFFFFFF); // White
    vex.display.vexDisplayBackgroundColor(0x000000); // Black

    // Display controller connection status
    const controller_status = vex.controller.vexControllerConnectionStatusGet(CONTROLLER_ID);

    if (controller_status == .kV5ControllerOffline) {
        vex.display.vexDisplayString(0, "Controller: OFFLINE");
    } else {
        vex.display.vexDisplayString(0, "Controller: CONNECTED");
    }

    // Display motor info
    const left_temp = vex.motor.vexDeviceMotorTemperatureGet(left_motor);
    const right_temp = vex.motor.vexDeviceMotorTemperatureGet(right_motor);

    vex.display.vexDisplayString(2, "Left Motor: %.1f°C", left_temp);
    vex.display.vexDisplayString(3, "Right Motor: %.1f°C", right_temp);

    // Display battery info
    const battery_voltage = vex.battery.vexBatteryVoltageGet();
    const battery_capacity = vex.battery.vexBatteryCapacityGet();

    vex.display.vexDisplayString(5, "Battery: %dmV (%.0f%%)", battery_voltage, battery_capacity);
}

/// Main task that runs the tank drive
fn driveTask() callconv(.C) c_int {
    while (true) {
        tankDrive();
        vex.task.vexTaskSleep(20); // Run at 50Hz
    }
    return 0;
}

/// Display task that updates the screen
fn displayTask() callconv(.C) c_int {
    var counter: u32 = 0;
    while (true) {
        if (counter % 10 == 0) { // Update display every 200ms
            displayInfo();
        }
        counter += 1;
        vex.task.vexTaskSleep(20);
    }
    return 0;
}

/// Competition autonomous routine
fn autonomous() void {
    // Example autonomous: drive forward for 2 seconds
    vex.motor.vexDeviceMotorVelocitySet(left_motor, 50);
    vex.motor.vexDeviceMotorVelocitySet(right_motor, 50);

    vex.task.vexTaskSleep(2000); // 2 seconds

    // Stop motors
    vex.motor.vexDeviceMotorVelocitySet(left_motor, 0);
    vex.motor.vexDeviceMotorVelocitySet(right_motor, 0);
}

/// Competition driver control routine
fn driverControl() void {
    // Tank drive is handled by the driveTask
    while (true) {
        // Check for competition status
        const comp_status = vex.competition.vexCompetitionStatus();

        // If autonomous starts, exit driver control
        if ((comp_status & 0x01) != 0) { // Autonomous bit
            break;
        }

        vex.task.vexTaskSleep(20);
    }
}

/// Main entry point
export fn main() void {
    // Initialize motors
    initMotors();

    // Display welcome message
    vex.display.vexDisplayString(0, "Tank Drive Example");
    vex.display.vexDisplayString(1, "Initializing...");

    vex.task.vexTaskSleep(1000);

    // Start drive task
    vex.task.vexTaskAdd(driveTask, 20, "Drive Task");

    // Start display task
    vex.task.vexTaskAdd(displayTask, 20, "Display Task");

    // Main loop - handle competition control
    while (true) {
        const comp_status = vex.competition.vexCompetitionStatus();

        if ((comp_status & 0x01) != 0) { // Autonomous mode
            autonomous();
        } else if ((comp_status & 0x02) != 0) { // Driver control mode
            driverControl();
        }

        vex.task.vexTaskSleep(20);
    }
}

// VEXos code signature
export const vexCodeSig: vex.system.vcodesig linksection(".text") = .{
    .magic = vex.system.V5_SIG_MAGIC,
    .type = vex.system.V5_SIG_TYPE_USER,
    .owner = vex.system.V5_SIG_OWNER_VEX,
    .options = vex.system.V5_SIG_OPTIONS_NONE,
};
