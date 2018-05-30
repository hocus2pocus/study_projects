puts 'Укажите три стороны треугольника:'
edges = []
3.times { edges << gets.to_f }
edges.sort!

if edges.min == edges.max
  puts 'Ваш треугольник - равносторонний.'
  puts 'Равносторонний треугольник не может быть прямоугольным.'
  exit
end

pythagorean = edges[2]**2 == edges[0]**2 + edges[1]**2

if pythagorean
  print 'Ваш треугольник прямоугольный'
  if triangle.select { |edge| triangle.count(edge) > 1 }.any?
    print ' и равнобедренный'
  end
  puts '.'
else
  puts 'Ваш треугольник не прямоугольный.'
end
