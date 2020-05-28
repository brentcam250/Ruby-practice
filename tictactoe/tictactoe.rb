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
      puts "invalid space already has a letter"
    end
  end

  def win? 
    #this method to determine if a win has occured on the board.
    @@WIN_COMBOS.each { |combo|
      #print " 1st #{@board[combo[0]].letter} 2nd #{@board[combo[1]].letter} 3rd #{@board[combo[2]].letter} \n"
      if((@board[combo[0]].letter == @board[combo[1]].letter)  && (@board[combo[1]].letter == @board[combo[2]].letter))
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

test_game.player_move("X", 3)
test_game.player_move("X", 4)
test_game.player_move("X", 5)
test_game.player_move("X", 6)
test_game.player_move("X", 7)
test_game.player_move("X", 8)
test_game.player_move("X", 0)
test_game.player_move("X", 1)
test_game.player_move("X", 2)

test_game.display_board

puts test_game.win?

puts test_game.full_board?