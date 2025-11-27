const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const real_path = try std.fs.cwd().realpathAlloc(allocator, ".");
    defer allocator.free(real_path);
    std.debug.print("{s}\n", .{real_path});

    const file = try std.fs.cwd().openFile("/tmp/test_zig.txt", .{ .mode = .read_write });
    defer file.close();
    try file.writeAll("hello zig!\n");
}
