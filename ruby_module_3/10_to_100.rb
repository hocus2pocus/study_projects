numbers = []
number = 10

loop do
  numbers << number
  number += 5
  break if number > 100
end

p numbers
