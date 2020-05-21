#dictionary is an array of words we are testing to see if each is contained in the test_word, and we will output a hash with a count
#of how many times each was found in the test_word.
def substring (test_word, dictionary)
  #make the test string lowercase.
  test_word = test_word.downcase
  output_hash = Hash.new(0)
  dictionary.each { |word| 
    #pass in downcased version of word to match our downcased test_word
    word_count = count_substring_appearances(test_word, word.downcase)
    if word_count > 0
      output_hash[word] += word_count
    end
  }
  return output_hash
end

#helper method that uses a regex to count the number of appearances of a given substring in a given string.
def count_substring_appearances(string, substring)
  string.scan(/(?=#{substring})/).count
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


result = substring("Howdy partner, sit Down! Hows it going?", dictionary)
puts result