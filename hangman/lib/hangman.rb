class Hangman
  attr_reader :secret_word
  attr_accessor :remaining_lives, :guessed_letters

  def initialize(load)
    # unless(load)
    #   @secret_word = set_secret_word
    #   @remaining_lives = 6
    #   @guessed_letters = []
    # else
    #   load_game
    # end

    @load = load
    @secret_word = set_secret_word

  end

  def find_random_word
    #method to grab a random word from the dictionary, it doesnt check word length at all
    File.open('../dictionary.txt', 'r') do |file|
      file_lines = file.readlines()
      random_line = file_lines[Random.rand(0..file_lines.size())]
    end
    
  end

  def set_secret_word
    word = ''
    until ((5..12).include?(word.length))
      #until the random word is between our length requirements.
      word = find_random_word
      puts "word: #{word} length: #{word.length}"
    end
    return word
  end

  def new_guess
    #takes user input for a new guess, display the board, if a win, end game
    puts "Guesser: please choose a letter"
    guess = gets.chomp.to_s.downcase
    while(guess.length != 1 || (a..z).include?(guess))
      puts "Guesser: please only choose a single letter"
      guess = gets.chomp.to_s.downcase
    end

  end

  # def display_letters_and_blanks
  #   #this method is called after new guess is made, it will show the word as blanks with the correct guessed letters filled in

  # end

  # def save_game

  # end

  # def load_game

  # end

  # def play_game
  #   while(@remaining_lives > 0)

  #     @remaining_lives -= 1 
  #   end
  # end
end


hangman = Hangman.new(false)