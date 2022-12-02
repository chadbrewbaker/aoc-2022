

// Totally cheating for today to get a template https://github.com/SpexGuy/Advent2022/blob/main/src/day01.zig

const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.StaticBitSet;

var gpa_impl = std.heap.GeneralPurposeAllocator(.{}){};
pub const gpa = gpa_impl.allocator();


const data = @embedFile("input.txt");

pub fn main() !void {
    const elves = blk: {
        var elves_list = std.ArrayList(i64).init(gpa);
        var lines = split(u8, data, "\n");
        var elf_total: i64 = 0;
        while (lines.next()) |line| {
            if (line.len == 0) {
                if (elf_total != 0) {
                    try elves_list.append(elf_total);
                    elf_total = 0;
                }
                continue;
            }
            const val = try parseInt(i64, line, 10);
            elf_total += val;
        }
        if (elf_total != 0) {
            try elves_list.append(elf_total);
        }
        break :blk elves_list.items;
    };

    var max: [3]i64 = .{0, 0, 0};

    for (elves) |e| {
        if (e > max[0]) {
            max[2] = max[1];
            max[1] = max[0];
            max[0] = e;
        } else if (e > max[1]) {
            max[2] = max[1];
            max[1] = e;
        } else if (e > max[2]) {
            max[2] = e;
        }
    }

    print("part1: {}\npart2: {}\n", .{max[0], max[0] + max[1] + max[2]});
}


const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
//const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;



//import sys

//text_file = open(sys.argv[1], "r")
//data = text_file.read()
//text_file.close()
//elf_sacks_raw = data.split("\n\n")
//elf_calories = []
//for sack in elf_sacks_raw:
//	items = sack.split()
//	items = list(map(int, items))
//	elf_calories.append(sum(items))
//print(max(elf_calories))
//print( sum(sorted(elf_calories, reverse=True)[0:3]))
// */
