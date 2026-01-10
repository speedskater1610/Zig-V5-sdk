pub const V5_ControllerId = enum(u8) {
    kControllerMaster = 0,
    kControllerPartner = 1,
};

pub const V5_ControllerStatus = enum(u8) {
    kV5ControllerOffline = 0,
    kV5ControllerTethered = 1,
    kV5ControllerVexnet = 2,
};

pub const V5_ControllerIndex = enum(u8) {
    AnaLeftX = 0,
    AnaLeftY = 1,
    AnaRightX = 2,
    AnaRightY = 3,
    AnaSpare1 = 4,
    AnaSpare2 = 5,
    Button5U = 6,
    Button5D = 7,
    Button6U = 8,
    Button6D = 9,
    Button7U = 10,
    Button7D = 11,
    Button7L = 12,
    Button7R = 13,
    Button8U = 14,
    Button8D = 15,
    Button8L = 16,
    Button8R = 17,
    ButtonSEL = 18,
    BatteryLevel = 19,
    ButtonAll = 20,
    Flags = 21,
    BatteryCapacity = 22,

    pub const Axis1 = V5_ControllerIndex.AnaRightX;
    pub const Axis2 = V5_ControllerIndex.AnaRightY;
    pub const Axis3 = V5_ControllerIndex.AnaLeftY;
    pub const Axis4 = V5_ControllerIndex.AnaLeftX;
    pub const ButtonL1 = V5_ControllerIndex.Button5U;
    pub const ButtonL2 = V5_ControllerIndex.Button5D;
    pub const ButtonR1 = V5_ControllerIndex.Button6U;
    pub const ButtonR2 = V5_ControllerIndex.Button6D;
    pub const ButtonUp = V5_ControllerIndex.Button7U;
    pub const ButtonDown = V5_ControllerIndex.Button7D;
    pub const ButtonLeft = V5_ControllerIndex.Button7L;
    pub const ButtonRight = V5_ControllerIndex.Button7R;
    pub const ButtonX = V5_ControllerIndex.Button8U;
    pub const ButtonB = V5_ControllerIndex.Button8D;
    pub const ButtonY = V5_ControllerIndex.Button8L;
    pub const ButtonA = V5_ControllerIndex.Button8R;
};

pub extern fn vexControllerGet(id: V5_ControllerId, index: V5_ControllerIndex) i32;
pub extern fn vexControllerConnectionStatusGet(id: V5_ControllerId) V5_ControllerStatus;
pub extern fn vexControllerTextSet(id: u32, line: u32, col: u32, buf: [*:0]const u8) u32;
