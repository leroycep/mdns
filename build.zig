const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mdns = b.addStaticLibrary(.{
        .name = "mdns",
        .target = target,
        .optimize = optimize,
    });
    mdns.addCSourceFile(.{ .file = .{ .path = "mdns.c" } });
    mdns.installHeader("mdns.h", "mdns.h");
    mdns.linkLibC();
    b.installArtifact(mdns);

    const exe = b.addExecutable(.{
        .name = "mdns-test",
        .target = target,
        .optimize = optimize,
    });
    exe.addCSourceFile(.{ .file = .{ .path = "mdns-test.c" } });
    exe.linkLibrary(mdns);
    exe.linkLibC();
    b.installArtifact(exe);
}
