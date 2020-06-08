class Mastermind
  attr_reader :secret_code, :total_guesses
  attr_accessor :correct_guess , :used_guesses
  def initialize
    @secret_code = set_secret_code
    @total_guesses = set_guesses
    @used_guesses = 0
    @correct_guess = false
  end

  def new_guess
    #this will take input from code-breaker and test to see if its right, or right places/numbers
    puts "Codebreaker, please enter your guess code, I will tell you two things: the count of digits in the correct place, and the count of correct digits in incorrect places"
    @used_guesses += 1
    guess = gets.chomp.to_i
    unless guess.to_s.chars.map(&:to_i).each { |digit|
      unless digit.between?(1,6)
        puts "#{digit} not between 1,6 I'm still counting this against your guesses!"
      end
    }
    end
    if(guess.to_s.length != 4)
      puts "your guess should have 4 digits this one counts, no freebies!"
      guess = new_guess
    end
    return guess
  end

  def correct_number_and_place(guess)
    #count how many correct number and place compared to secret code
    digits = guess.to_s.chars
    secret_digits = @secret_code.to_s.chars
    count = 0
    for i in 0..3
      if digits[i] == secret_digits[i]
        count += 1
      end
    end
    if count == 4
      @correct_guess = true
    end
    return count
  end

  def correct_number_only(guess, correct_position)
    #count how many correct numbers but incorrect place.
    digits = guess.to_s.chars.map(&:to_i)
    guess_hash = Hash.new(0)
    digits.each { |digit| guess_hash[digit] += 1 }
    secret_digits = @secret_code.to_s.chars.map(&:to_i)
    secret_hash = Hash.new(0)
    secret_digits.each { |secret_digit| secret_hash[secret_digit] += 1}
    count = 0
    for i in 1..6
      if secret_hash[i] > 0 && guess_hash[i] > 0 
        #this means they both have at least 1 digit.
        if secret_hash[i] > guess_hash[i]
          count += guess_hash[i]
        else
          count += secret_hash[i]
        end
      end
    end
    #subtract those in the correct position to determine digits that are correct but ordered wrong.
    return count - correct_position

  end

  def play_game
    until(@used_guesses >= @total_guesses || @correct_guess)
      guess = new_guess
      num_and_place = correct_number_and_place(guess)
      if num_and_place == 4 
        puts "Codebreaker: You've succesfully broken the code! you win!"
        break
      end
      just_num = correct_number_only(guess, num_and_place)
      puts "Codebreaker: your guess of #{guess} has #{num_and_place} digits in the correct place and #{just_num} 
      correct digits in the wrong place you have #{@total_guesses - @used_guesses} left"
    end
    if(@correct_guess)
      "Congrats Codebreaker you win, the secret code was #{guess}!"
    else 
      "Sorry Codebreaker, Codemaker beat you this time"
    end
  end

  def set_secret_code
    #takes input from codemaker player, and uses that to test codebreakers skills
    puts "Codemaker please enter a 4-digit number to be used as your secret code. make sure that the digits are between 1, 6"
    secret_code = gets.chomp
    bad_code = false
    unless secret_code.to_s.chars.map(&:to_i).each { |digit|
      unless digit.between?(1,6)
        puts "#{digit} not between 1,6 try again "
        bad_code = true
      end
    }
    end
    if(secret_code.length != 4)
      puts "the code wasn't exactly 4 chars long, try again"
      bad_code = true
    end
    if bad_code 
      secret_code = set_secret_code
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