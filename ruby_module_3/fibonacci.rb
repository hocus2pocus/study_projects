fibonacci = [0]
number = 1

while number < 100
  fibonacci << number
  number += fibonacci[-2]
end

p fibonacci
