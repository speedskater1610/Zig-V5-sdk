pub const V5_TouchEvent = enum(u8) {
    kTouchEventRelease = 0,
    kTouchEventPress = 1,
    kTouchEventPressAuto = 2,
};

pub const V5_TouchStatus = extern struct {
    lastEvent: V5_TouchEvent,
    lastXpos: i16,
    lastYpos: i16,
    pressCount: i32,
    releaseCount: i32,
};

pub extern fn vexTouchUserCallbackSet(callback: *const fn (V5_TouchEvent, i32, i32) callconv(.C) void) void;
pub extern fn vexTouchDataGet(status: *V5_TouchStatus) void;
