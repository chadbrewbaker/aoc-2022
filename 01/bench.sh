rm calories-v1-rs
rustc   -C opt-level=3 -C panic=abort -C  codegen-units=1  -o calories-v1-rs calories-v1.rs 
strip calories-v1-rs 

rm calories-v1-zig
zig build-exe -O ReleaseFast calories-v1.zig --name calories-v1-zig
strip calories-v1-zig

hyperfine './calories-v1-zig input.txt' 'python3 calories-v1.py input.txt' './calories-v1-rs input.txt'
