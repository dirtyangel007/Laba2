print "Введите числа через пробел: "
numbers = gets.strip.split.map(&:to_i)

count = numbers.count { |num| num.to_s.length.odd? }

puts "Количество чисел с нечётным числом цифр: #{count}"
