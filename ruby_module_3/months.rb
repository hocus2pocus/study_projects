# months = { name of month => length in days }
months = { 
  January: 31, 
  February_common: 28,
  February_leap: 29, 
  March: 31,
  April: 30, 
  May: 31,
  June: 30, 
  July: 31,
  August: 31, 
  September: 30,
  October: 31, 
  November: 30,
  December: 31 
}

# thirty days length months
# VladFiliucov: to_s лишний. Будет и без него выводить в виде строки
# выводится в виде символа всё таки, по условию задачи не принципиально
months.each { |month, days| p month if days == 30 }
