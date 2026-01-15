const std = @import("std");

const vexDevicesGetNumber_OFFSET: usize = 0x190;
const vexDevicesGetNumber = fn() u32;

pub fn _vexDevicesGetNumber() u32 {
    const fn_ptr_address = JUMP_TABLE_BASE + vexDevicesGetNumber_OFFSET;
    const fn_addr_val = @as(*const u32, fn_ptr_address)[0];
    
    const fn_ptr = @as(vexDevicesGetNumber, @ptrFromInt(fn_addr_val));

    return fn_ptr();
}
