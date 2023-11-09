const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "mdns",
        .root_source_file = .{ .path = "mdns.c" },
        .target = target,
        .optimize = optimize,
    });
    lib.installHeader("mdns.h", "mdns.h");
    lib.linkLibCpp();
    b.installArtifact(lib);
}
