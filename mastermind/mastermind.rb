class Mastermind
  attr_reader :secret_code, :total_guesses, :used_guesses
  def initialize
    @secret_code = set_secret_code
    @total_guesses = set_guesses
    @used_guesses = 0
    @correct_guess = false
  end

  def new_guess
    #this will take input from code-breaker and test to see if its right, or right places/numbers
    puts "Codebreaker, please enter your guess code, I will tell you two things: the count of digits in the correct place, and the count of correct digits in incorrect places"
    guess = gets.chomp.to_i
  end

  def correct_number_and_place(guess)
    #count how many correct number and place compared to secret code
    digits = guess.to_s.chars
    secret_digits = @secret_code.to_s.chars
    # puts secret_digits
    # puts "super #{@secret_code} secret codeeee"
    count = 0
    iteration = 0
    for i in 0..3
      puts "digits: #{digits[i]} secret: #{secret_digits[i]}"
      if digits[i] == secret_digits[i]
        count += 1
      end
    end
    return count
  end

  def correct_number_only(guess)
    #count how many correct numbers but incorrect place.
    puts "correct_number_only"
  end

  def play_game
    until(@used_guesses >= @total_guesses || @correct_guess)
      guess = new_guess
      num_and_place = correct_number_and_place(guess)
      just_num = correct_number_only(guess)
      puts "Codebreaker: your guess of #{guess} has #{num_and_place} digits in the correct place and #{just_num} 
      correct digits in the wrong place"
    end
    if(correct_guess)
      "Congrats Codebreaker you win, the secret code was #{guess}!"
    else 
      "Sorry Codebreaker, Codemaker beat you this time"
    end
  end

  def set_secret_code
    #takes input from codemaker player, and uses that to test codebreakers skills
    puts "Codemaker please enter a 4-digit number to be used as your secret code. make sure that the digits are between 1, 6"
    secret_code = gets.chomp
    unless secret_code.to_s.chars.map(&:to_i).each { |digit|
      unless digit.between?(1,6)
        puts "#{digit} not between 1,6 "
      end
    }
    end
    return secret_code
  end

  def set_guesses
    #takes input from codemaker player, uses that to set how many guesses codebreaker gets
    puts "Codemaker please enter a number between 8-12 for how many guesses you'd like codebreaker to have"
    guesses = gets.chomp.to_i
    until(guesses.between?(8,12))
      puts "please play nicely, choose between 8, 12"
      guesses = gets.chomp.to_i
    end
    return guesses
  end


end

instance = Mastermind.new()

instance.play_game