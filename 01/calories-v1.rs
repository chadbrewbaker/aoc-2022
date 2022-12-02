use std::env;
use std::fs;

fn main() {
    let args: Vec<_> = env::args().collect();

    let data = fs::read_to_string(args[1].clone()).expect("Unable to read file");

    let mut split = data.split("\n\n");
    let mut calorie_vec = Vec::new();
    for elf in split {
        let numbers: Vec<u32> = elf
            .split_whitespace()
            .map(|s| s.parse().expect("parse error"))
            .collect();
        let calories: u32 = numbers.iter().sum();

        calorie_vec.push(calories);
    }
    //reverse the standard comparison order
    calorie_vec.sort_by(|a, b| b.cmp(a));

    println!("{} ", calorie_vec[0]);

    let mut sum = 0;
    for i in 0..3 {
        sum += calorie_vec[i];
    }

    println!("{} ", sum);
}
