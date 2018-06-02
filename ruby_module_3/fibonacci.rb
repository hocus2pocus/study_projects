fibonacci = [0]
number = 1

loop do
  fibonacci << number
  number += fibonacci[-2]
  break if number > 100
end

p fibonacci
