puts "Введите число 'a':"
print "> "
a = gets.to_f

puts "Введите число 'b':"
print "> "
b = gets.to_f

puts "Введите число 'c':"
print "> "
c = gets.to_f

discr = b**2 - 4 * a * c

puts "Дискриминант = #{discr}"
if discr < 0
  puts "Корней нет."
elsif discr == 0
  puts "x1 = x2 = #{-b / (2 * a)}"
else
  sqrt = Math.sqrt(discr)
  puts "x1 = #{(-b + sqrt) / (2 * a)}"
  puts "x2 = #{(-b - sqrt) / (2 * a)}"
end
