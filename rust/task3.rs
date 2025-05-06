use std::io;

fn sum_of_digits(mut n: i32) -> i32 {
    let mut sum = 0;
    while n > 0 {
        sum += n % 10;
        n /= 10;
    }
    sum
}

fn prod_of_digits(mut n: i32) -> i32 {
    let mut product = 1;
    while n > 0 {
        product *= n % 10;
        n /= 10;
    }
    product
}

fn main() {
    println!("Введите числа через пробел:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();

    let numbers: Vec<i32> = input.trim()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();

    print!("Номера, где сумма цифр < произведения: ");
    for (i, &num) in numbers.iter().enumerate() {
        if sum_of_digits(num) < prod_of_digits(num) {
            print!("{} ", i + 1);
        }
    }
    println!();
}
