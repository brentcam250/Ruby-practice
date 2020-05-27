class TicTacToe 
  @WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,6],[6,4,2]]
   
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
    @board[space].letter = player_letter
  end

  def win? 
    #this method to determine if a win has occured on the board.
    
  end

  def full_board?
    #this method to determine if all spaces have been played, aka a draw... assuming someone didnt win on the last play.
  end

end

class Cell 
  attr_accessor :letter
  #once the id is created it should stay the same
  attr_reader :id 
  def initialize(id)
    @id = id
    @letter = ' '
  end

end

test_game = TicTacToe.new()

test_game.display_board

test_game.player_move("X", 3)

test_game.display_board