puts 'Введите список своих покупок.'
puts 'Для каждой покупки вам необходимо ввести наименование товара, его стоимость и количество купленных единиц.'
puts "Введите 'стоп', если покупок больше не осталось."
puts ''

purchases = {}

loop do
  print 'товар: '
  goods = gets.chomp
  break if goods == "стоп"
  print 'стоимость: '
  value = gets.to_f
  print 'количество: '
  quantity = gets.chomp.to_i
  purchases[goods] = {value: value, quantity: quantity}
end

puts ''

puts purchases

puts ''

price_of_cart = 0

purchases.each do |goods, price| 
  full_price = price[:value] * price[:quantity]
  puts "Итоговая цена товара '#{goods}' в количестве '#{price[:value]}'' по цене '#{price[:quantity]}' за единицу составила '#{full_price}'."
  price_of_cart += full_price
end

puts ''

puts "Итоговая стоимость всех покупок составила '#{price_of_cart}'."
