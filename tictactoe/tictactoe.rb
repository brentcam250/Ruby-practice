class TicTacToe 
  @@WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,6],[6,4,2]]
   
  def initialize
    # initialize by making 9 cells,
    @board = []
    for i in 0..8
      @board.push(Cell.new(i));
    end
  end

  def display_board()
    #this method to be used to show the current board.
    for i in 0..8
      if i% 3 == 0
        print "\n|#{@board[i].id} #{@board[i].letter} |"
      else
        print "|#{@board[i].id} #{@board[i].letter} |"

      end
    end
    print "\n"

  end

  def player_move(player_letter, space)
    #this method to be called when a player makes a move


    unless(@board[space].is_full)
      @board[space].letter = player_letter
      @board[space].is_full = true
    else
      puts "invalid space, choose an empty space"
    end

    if win?
      #most recent player must have generated a win, then we have to end the game. 
      puts "#{player_letter} Wins!"
      #want to return so that no more letters can be played on a board thats already got a winner.
      return
    elsif full_board?
      puts "Draw!"
    end
  end

  def win? 
    #this method to determine if a win has occured on the board.
    @@WIN_COMBOS.each { |combo|
      #print " 1st #{@board[combo[0]].letter} 2nd #{@board[combo[1]].letter} 3rd #{@board[combo[2]].letter} \n"
      if((@board[combo[0]].letter == @board[combo[1]].letter)  && (@board[combo[1]].letter == @board[combo[2]].letter) && (@board[combo[1]].letter != ' '))
        print " winning combo is: #{combo[0]}, #{combo[1]}, #{combo[2]} \n"
        return true
      end
    }
    return false
  end

  def full_board?
    #this method to determine if all spaces have been played, aka a draw... assuming someone didnt win on the last play.
    full_board = true
    @board.each { |cell|
      if cell.letter == ' ' 
        full_board = false
      end
    }
    return full_board
  end

end

class Cell 
  attr_accessor :letter, :is_full
  #once the id is created it should stay the same
  attr_reader :id 
  def initialize(id)
    @id = id
    @letter = ' '
    @is_full = false
  end

end

test_game = TicTacToe.new()

test_game.display_board


#x plays first, then we swap letters until winner or draw.
x_turn = true
until (test_game.win? || test_game.full_board?)
  puts x_turn ? "Player X please type which square you'd like to play" : "Player O please type which square you'd like to play"
  square = gets.chomp.to_i
  until(square.between?(0,8))
    puts "please play nicely, choose between 0, 8"
    square = gets.chomp.to_i
  end
  current_letter = x_turn ? "X" : "O"
  test_game.player_move(current_letter, square)
  test_game.display_board
  x_turn = !x_turn
end
  
