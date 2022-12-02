rustc   -C opt-level=3 -C panic=abort -C  codegen-units=1  -o calories-v1-rs calories-v1.rs 
strip calories-v1-rs 

hyperfine 'python3 calories-v1.py input.txt' './calories-v1-rs input.txt'
