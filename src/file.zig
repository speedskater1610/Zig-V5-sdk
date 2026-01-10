pub const FRESULT = enum(u8) {
    FR_OK = 0,
    FR_DISK_ERR = 1,
    FR_INT_ERR = 2,
    FR_NOT_READY = 3,
    FR_NO_FILE = 4,
    FR_NO_PATH = 5,
    FR_INVALID_NAME = 6,
    FR_DENIED = 7,
    FR_EXIST = 8,
    FR_INVALID_OBJECT = 9,
    FR_WRITE_PROTECTED = 10,
    FR_INVALID_DRIVE = 11,
    FR_NOT_ENABLED = 12,
    FR_NO_FILESYSTEM = 13,
    FR_MKFS_ABORTED = 14,
    FR_TIMEOUT = 15,
    FR_LOCKED = 16,
    FR_NOT_ENOUGH_CORE = 17,
    FR_TOO_MANY_OPEN_FILES = 18,
    FR_INVALID_PARAMETER = 19,
};

pub const FIL = opaque {};

pub extern fn vexFileMountSD() FRESULT;
pub extern fn vexFileDirectoryGet(path: [*:0]const u8, buffer: [*]u8, len: u32) FRESULT;
pub extern fn vexFileOpen(filename: [*:0]const u8, mode: [*:0]const u8) ?*FIL;
pub extern fn vexFileOpenWrite(filename: [*:0]const u8) ?*FIL;
pub extern fn vexFileOpenCreate(filename: [*:0]const u8) ?*FIL;
pub extern fn vexFileClose(fdp: *FIL) void;
pub extern fn vexFileWrite(buf: [*]u8, size: u32, nItems: u32, fdp: *FIL) i32;
pub extern fn vexFileSize(fdp: *FIL) i32;
pub extern fn vexFileSeek(fdp: *FIL, offset: u32, whence: i32) FRESULT;
pub extern fn vexFileRead(buf: [*]u8, size: u32, nItems: u32, fdp: *FIL) i32;
pub extern fn vexFileDriveStatus(drive: u32) bool;
pub extern fn vexFileTell(fdp: *FIL) i32;
pub extern fn vexFileSync(fdp: *FIL) void;
pub extern fn vexFileStatus(filename: [*:0]const u8) u32;
