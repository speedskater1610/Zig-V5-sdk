pub extern fn vexTaskAdd(callback: *const fn () callconv(.C) c_int, interval: c_int, label: [*:0]const u8) void;
pub extern fn vexTaskGetCallbackAndId(index: u32, callback_id: *c_int) ?*anyopaque;
pub extern fn vexTaskSleep(time: u32) void;
pub extern fn vexBackgroundProcessing() void;
pub extern fn vexTasksRun() void;
