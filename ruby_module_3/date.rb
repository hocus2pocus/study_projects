#Пользовательский ввод даты с проверкой корректности ввода.
date = {}

puts 'Введите дату:'
print 'Число: '
date[:day] = gets.chomp.to_i

if date[:day] < 1 || date[:day] > 31
  puts 'Вы не верно указали число (значение не может быть больше 31 и меньше 1).'
  exit
end

print 'Месяц: '
date[:month] = gets.chomp.to_i

if date[:month] < 1 || date[:month] > 12
  puts 'Вы не верно указали месяц (значение не может быть больше 12 и меньше 1).'
  exit
end

print 'Год: '
date[:year] = gets.chomp.to_i

#Массив массивов, содержащий кол-во дней в каждом месяце.
months = { January: 31,
February: 28,
March: 31,
April: 30,
May: 31,
June: 30,
July: 31,
August: 31,
September: 30,
October: 31,
November: 30,
December: 31 }.to_a

#Проверка, является ли введённый год високосным.
year_is_leap = 0
if date[:year] % 400 == 0
  year_is_leap = 1
elsif date[:year] % 4 == 0 && date[:year] % 100 == 0
  year_is_leap = 0
elsif date[:year] % 4 == 0
  year_is_leap = 1
else
  year_is_leap = 0
end

#Если год високосный, меняем кол-во дней в месяце Февраль на 29.
if year_is_leap == 1
  months[1][1] = 29
end

#Считаем порядковый номер введённого дня с начала года.
#В переменной days собираем кол-во дней всех месяце с начала года до введенной даты, не включая введённый месяц.
days = 0
months.each do |month|
  break if date[:month] == months.index(month).+(1)
  days += month.last
end

#Выводим результат. Порядковый номер введённого дня = значение переменной days + введённый пользователем день.
puts "Введена дата #{date[:day]}.#{date[:month]}.#{date[:year]}, это #{days + date[:day]}й день #{}года. "
puts "#{date[:year]} год - високосный." if year_is_leap == 1
