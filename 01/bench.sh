rm calories-v1-rs
rustc   -C opt-level=3 -C panic=abort -C  codegen-units=1  -o calories-v1-rs calories-v1.rs 
strip calories-v1-rs 
rustc   -C opt-level=3 -C panic=abort -C  codegen-units=1 -C debuginfo=2 -C embed-bitcode=yes  -o calories-v1-rs-dbg calories-v1.rs 



rm calories-v1-zig
zig build-exe   -O ReleaseFast calories-v1.zig --name calories-v1-zig
strip calories-v1-zig

rm calories-v2-zig
zig build-exe   -O ReleaseFast calories-v2.zig --name calories-v2-zig
strip calories-v2-zig



hyperfine  './calories-v2-zig input.txt' './calories-v1-zig input.txt' 'python3 calories-v1.py input.txt' './calories-v1-rs input.txt'
