const std = @import("std");
const beacon = @import("bofapi").beacon;
const posix = @import("bofapi").posix;

pub export fn go() callconv(.C) u8 {
    var name: [posix.HOST_NAME_MAX + 1]u8 = undefined;
    var namelen: usize = posix.HOST_NAME_MAX;

    const ret = posix.gethostname(@as([*:0]u8, @ptrCast(&name)), namelen);
    if (ret != 0)
        return 1;

    _ = beacon.printf(0, "%s\n", &name);

    return 0;
}