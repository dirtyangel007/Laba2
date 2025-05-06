print "Введите число: "
n = gets.to_i
start_code = 'A'.ord + n - 1

(1..n).each do |i|
  line = ""
  i.times do |j|
    line += (start_code - j).chr
  end
  puts line
end
