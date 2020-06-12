class Hangman
  attr_reader :secret_word
  attr_accessor :remaining_lives, :guessed_letters

  def initialize
    puts "WordSetter: do you wish you load a game? (y/n)"
    response = gets.chomp.to_s.downcase
    until(response == 'y' || response == 'n')
      puts "Please respond either y or n"
      response = gets.chomp.to_s.downcase
    end
    if(response == 'y')
      load = true
    else
      load = false
    end
    unless(load)
      @secret_word = set_secret_word
      @remaining_lives = 6
      @guessed_letters = []
      @word_state = []
      @word_state.fill('_', 0, secret_word.length)
    else
      load_game
    end

    play_game
    # @load = load
    # @secret_word = set_secret_word

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
    puts "\nGuesser: please choose a letter"
    guess = gets.chomp.to_s.downcase
    while(guess.length != 1 || !('a'..'z').include?(guess))
      puts "Guesser: please only choose a single letter"
      guess = gets.chomp.to_s.downcase
    end
    #else theyve played nicely and only guessed a single letter
    if(@guessed_letters.include?(guess))
      puts "you've already guessed that letter!"
    else
      # @remaining_lives -= 1 unless(@secret_word.include?(guess))
      if(@secret_word.include?(guess))

      else
        @remaining_lives -= 1
      end
      @guessed_letters = @guessed_letters.push(guess)
    end

  end

  def display_letters_and_blanks
    #this method is called after new guess is made, it will show the word as blanks with the correct guessed letters filled in
    puts "Letters guessed: #{@guessed_letters}"
    puts "Remaining lives: #{@remaining_lives}"
    puts "State of your guessing: #{@word_state}"

  end

  def save_game
    #serialize the state of the game, and save that data into file
  end

  def load_game
    #get input from user which file contains their save file, and load that into the current session.
    #deserialize data from file.
    puts "Please type the name of your save file"
    save_file = gets.chomp.to_s
  end

  def play_game
    while(@remaining_lives > 0)
      new_guess
      display_letters_and_blanks
    end
  end
end


hangman = Hangman.new

