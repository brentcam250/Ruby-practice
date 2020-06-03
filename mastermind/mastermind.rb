class Mastermind
  attr_reader :secret_code, :number_guesses
  def initialize
    @secret_code = set_secret_code
    @number_guesses = set_guesses
  end

  def new_guess
    #this will take input from code-breaker and test to see if its right, or right places/numbers
  end

  def correct_number_and_place
    #count how many correct number and place compared to secret code
  end

  def correct_number_only
    #count how many correct numbers but incorrect place.
  end

  def play_game

  end

  def set_secret_code
    #takes input from codemaker player, and uses that to test codebreakers skills
    puts "Codemaker please enter a 4-digit number to be used as your secret code. make sure that the digits are between 1, 6"
    secret_code = gets.chomp.to_i
    until
  end

  def set_guesses
    #takes input from codemaker player, uses that to set how many guesses codebreaker gets
    puts "Codemaker please enter a number between 8-12 for how many guesses you'd like codebreaker to have"
    guesses = gets.chomp.to_i
    until(square.between?(8,12))
      puts "please play nicely, choose between 8, 12"
      guesses = gets.chomp.to_i
    end
    return guesses
  end


end