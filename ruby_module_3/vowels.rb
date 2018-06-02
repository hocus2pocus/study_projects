alphabet = ('A'..'Z').to_a
vowels = {}

alphabet.each do |letter|
 if ['A', 'E', 'I', 'O', 'U', 'Y'].include?(letter)
  vowels.store(letter, alphabet.index(letter).+(1))
  end
end

p vowels
