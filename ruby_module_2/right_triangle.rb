puts 'Укажите три стороны треугольника:'
edges = []
3.times {edges << gets.chomp.to_f}

triangle = edges.sort.map {|edge| edge**2}

puts 'Параметры вышего треугольника:'
triangle[0] + triangle[1] == triangle[2] ? (puts '* прямоугольный') : (puts '* не прямоугольный')
triangle.select {|edge| triangle.count(edge) > 1}.any? ? (puts '* равнобедренный') : (puts '* не равнобедренный')
triangle.min == triangle.max ? (puts '* равносторонний') : (puts '* не равносторонний')
puts ''
puts 'Спасибо.'
