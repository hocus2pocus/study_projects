puts "Укажите Ваше имя:"
print "> "
name = gets.chomp

puts "Укажите Ваш рост:"
print "> "
height = gets.chomp.to_i

weight = height - 110

weight < 0 ? (puts "#{name}, Ваш вес уже оптимален.") : (puts "#{name}, Ваш идеальный вес - #{weight}.")