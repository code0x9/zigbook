const std = @import("std");

extern fn fizzbuzz(n: usize) ?[*:0]const u8;

pub fn main() !void {
    var stdout_buffer: [256]u8 = undefined;
    var writer_state = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &writer_state.interface;

    for (0..100) |n| {
        if (fizzbuzz(n)) |s| {
            try stdout.print("{s}\n", .{s});
        } else {
            try stdout.print("{d}\n", .{n});
        }
    }
    try stdout.flush();
}
