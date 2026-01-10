const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .arm,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_a9 },
        .os_tag = .freestanding,
        .abi = .eabi,
    });

    const optimize = b.standardOptimizeOption(.{});

    // Create a module for the library
    const vex_module = b.addModule("vex-sdk", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Create the library object file
    const obj = b.addObject(.{
        .name = "vex-sdk",
        .root_module = vex_module,
    });

    // Manually install the object file to zig-out/lib/
    const install_obj = b.addInstallFile(obj.getEmittedBin(), "lib/vex-sdk.o");

    b.getInstallStep().dependOn(&install_obj.step);

    // Also create a static archive (.a file) using ar
    const ar_step = b.addSystemCommand(&.{
        "arm-none-eabi-ar", // Use ARM toolchain ar
        "rcs",
    });

    const lib_output = b.pathJoin(&.{ b.install_path, "lib", "libvex-sdk.a" });
    ar_step.addArg(lib_output);
    ar_step.addFileArg(obj.getEmittedBin());
    ar_step.step.dependOn(&obj.step);

    const install_ar = b.step("archive", "Create static library archive (.a)");
    install_ar.dependOn(&ar_step.step);
}
