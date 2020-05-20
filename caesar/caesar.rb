def caesar_cipher(input, shift)
  num_shift = shift.to_i
  chars = input.split('')
  alphabet = []
  #build the alphabet array.
  for letter in "a".."z" do
    alphabet.push(letter)
  end

  upper_alphabet = alphabet.map{ |char| char.upcase}

  output = ''
  chars.each { |c| 
    index = alphabet.index(c)
    upcase_index = upper_alphabet.index(c);
    #if index doesnt return nil, aka the letter is in the array and not a special char like punctuation.
    if index 
      shifted_index = (index + shift) % 26
      output += (alphabet[shifted_index])
    elsif upcase_index
      shifted_index = (upcase_index + shift) % 26
      output += (upper_alphabet[shifted_index])
    else 
      #just push the same char
      output += (c)
    end
  }
  return output

end

puts "enter a phrase!"
to_encode = gets.chomp
puts "whats your encryption key?"
shift = gets.chomp.to_i

puts caesar_cipher(to_encode, shift)