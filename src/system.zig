pub const vcodesig = extern struct {
    magic: u32,
    type: u32,
    owner: u32,
    options: u32,
};

pub const V5_SIG_MAGIC: u32 = 0x35585658;
pub const EX_SIG_MAGIC: u32 = 0x45585658;
pub const V5_SIG_TYPE_USER: u32 = 0;
pub const V5_SIG_OWNER_SYS: u32 = 0;
pub const V5_SIG_OWNER_VEX: u32 = 1;
pub const V5_SIG_OWNER_PARTNER: u32 = 2;
pub const V5_SIG_OPTIONS_NONE: u32 = 0;
pub const V5_SIG_OPTIONS_INDG: u32 = 1 << 0;
pub const V5_SIG_OPTIONS_EXIT: u32 = 1 << 1;
pub const V5_SIG_OPTIONS_THDG: u32 = 1 << 2;

pub const time = extern struct {
    ti_hour: u8,
    ti_min: u8,
    ti_sec: u8,
    ti_hund: u8,
};

pub const date = extern struct {
    da_year: u16,
    da_day: u8,
    da_mon: u8,
};

pub extern fn vexScratchMemoryPtr(ptr: *?*anyopaque) i32;
pub extern fn vexScratchMemoryLock() bool;
pub extern fn vexScratchMemoryUnlock() void;
pub extern fn vexSystemTimeGet() u32;
pub extern fn vexGettime() time;
pub extern fn vexGetdate() date;
pub extern fn vexSystemMemoryDump() void;
pub extern fn vexSystemDigitalIO(pin: u32, value: u32) void;
pub extern fn vexSystemStartupOptions() u32;
pub extern fn vexSystemExitRequest() void;
pub extern fn vexSystemHighResTimeGet() u64;
pub extern fn vexSystemPowerupTimeGet() u64;
pub extern fn vexSystemLinkAddrGet() u32;
pub extern fn vexSystemUsbStatus() u32;
pub extern fn vexSystemTimerStop() void;
pub extern fn vexSystemTimerClearInterrupt() void;
pub extern fn vexSystemTimerReinitForRtos(priority: u32, handler: *const fn (?*anyopaque) callconv(.C) void) i32;
pub extern fn vexSystemApplicationIRQHandler(ulICCIAR: u32) void;
pub extern fn vexSystemWatchdogReinitRtos() i32;
pub extern fn vexSystemWatchdogGet() u32;
pub extern fn vexSystemBoot() void;
pub extern fn vexSystemUndefinedException() void;
pub extern fn vexSystemFIQInterrupt() void;
pub extern fn vexSystemIRQInterrupt() void;
pub extern fn vexSystemSWInterrupt() void;
pub extern fn vexSystemDataAbortInterrupt() void;
pub extern fn vexSystemPrefetchAbortInterrupt() void;
pub extern fn vexSystemVersion() u32;
pub extern fn vexStdlibVersion() u32;
