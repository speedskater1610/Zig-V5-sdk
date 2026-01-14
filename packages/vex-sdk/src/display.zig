pub const v5_image = extern struct {
    width: u16,
    height: u16,
    data: [*]u32,
    p: [*]u32,
};

pub extern fn vexDisplayForegroundColor(col: u32) void;
pub extern fn vexDisplayBackgroundColor(col: u32) void;
pub extern fn vexDisplayErase() void;
pub extern fn vexDisplayScroll(nStartLine: i32, nLines: i32) void;
pub extern fn vexDisplayScrollRect(x1: i32, y1: i32, x2: i32, y2: i32, nLines: i32) void;
pub extern fn vexDisplayCopyRect(x1: i32, y1: i32, x2: i32, y2: i32, pSrc: [*]u32, srcStride: i32) void;
pub extern fn vexDisplayPixelSet(x: u32, y: u32) void;
pub extern fn vexDisplayPixelClear(x: u32, y: u32) void;
pub extern fn vexDisplayLineDraw(x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexDisplayLineClear(x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexDisplayRectDraw(x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexDisplayRectClear(x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexDisplayRectFill(x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexDisplayCircleDraw(xc: i32, yc: i32, radius: i32) void;
pub extern fn vexDisplayCircleClear(xc: i32, yc: i32, radius: i32) void;
pub extern fn vexDisplayCircleFill(xc: i32, yc: i32, radius: i32) void;
pub extern fn vexDisplayTextSize(n: u32, d: u32) void;
pub extern fn vexDisplayFontNamedSet(pFontName: [*:0]const u8) void;
pub extern fn vexDisplayForegroundColorGet() u32;
pub extern fn vexDisplayBackgroundColorGet() u32;
pub extern fn vexDisplayStringWidthGet(pString: [*:0]const u8) i32;
pub extern fn vexDisplayStringHeightGet(pString: [*:0]const u8) i32;
pub extern fn vexDisplayClipRegionSet(x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexDisplayRender(bVsyncWait: bool, bRunScheduler: bool) void;
pub extern fn vexDisplayDoubleBufferDisable() void;
pub extern fn vexDisplayClipRegionSetWithIndex(index: i32, x1: i32, y1: i32, x2: i32, y2: i32) void;
pub extern fn vexImageBmpRead(ibuf: [*]const u8, oBuf: *v5_image, maxw: u32, maxh: u32) u32;
pub extern fn vexImagePngRead(ibuf: [*]const u8, oBuf: *v5_image, maxw: u32, maxh: u32, ibuflen: u32) u32;
