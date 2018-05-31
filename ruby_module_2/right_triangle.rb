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
isosceles = edges[0] == edges[1]

if pythagorean && isosceles
  puts 'Ваш треугольник прямоугольный и равнобедренный.'
elsif pythagorean
  puts 'Ваш треугольник прямоугольный.'
else
  puts 'Ваш треугольник не прямоугольный.'
end
