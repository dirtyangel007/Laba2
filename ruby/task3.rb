print "Введите числа через пробел: "
numbers = gets.strip.split.map(&:to_i)

result = []

numbers.each_with_index do |num, idx|
  digits = num.digits
  sum = digits.sum
  product = digits.reduce(1, :*)

  result << idx + 1 if sum < product
end

puts "Номера, где сумма цифр < произведения: #{result.join(' ')}"
