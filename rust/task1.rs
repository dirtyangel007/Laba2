use std::io;

fn main() {
    println!("Введите число: ");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: usize = input.trim().parse().unwrap();

    let start = ('A' as u8) + (n as u8 - 1);

    for i in 1..=n {
        let mut line = String::new();
        for j in 0..i {
            line.push((start - j as u8) as char);
        }
        println!("{}", line);
    }
}
