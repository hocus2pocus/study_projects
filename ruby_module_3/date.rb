puts 'Введите дату:'
print 'Число: '
day = gets.to_i

print 'Месяц: '
month = gets.to_i

print 'Год: '
year = gets.to_i

feb = 28
feb = 29 if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) 

months = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

unless month.between?(1, 12) && day.between?(1, months[month - 1])
  puts "Вы не верно указали дату. Проверьте корректность ввода дня в зависимости от месяца, а также корректность ввода месяца (значение не может быть больше 12)."
  puts "Учтите, что #{year} год - високосный." if feb == 29
  exit
end

days = months.first(month - 1).sum
puts "Введена дата #{day}.#{month}.#{year}, это #{days + day}й день #{year}го года. "
puts "#{year} год - високосный." if feb == 29
