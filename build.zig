const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "mdns",
        .target = target,
        .optimize = optimize,
    });
    lib.addCSourceFile(.{ .file = .{ .path = "mdns.c" } });
    lib.installHeader("mdns.h", "mdns.h");
    lib.linkLibC();
    b.installArtifact(lib);
}
