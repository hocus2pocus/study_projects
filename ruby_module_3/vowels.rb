#Массивом задаю список гласных.
vowels = ['A', 'E', 'I', 'O', 'U', 'Y']

#Создаю хэш гласных букв и увеличиваю их индекс на 1.
alphabet = {} 

('A'..'Z').each_with_index do |letter, index| 
  alphabet[letter] = index + 1 if vowels.include?(letter)
end

#Вывожу откорректированный хэш, содержащий только глассные.
p alphabet
