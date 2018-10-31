require_relative "cursor.rb"
require_relative "board.rb"
require_relative "display.rb"
require_relative "sliding_piece.rb"
require_relative "stepping_piece.rb"

class Game
  attr_reader :display, :board
  def initialize(board = Board.new)
    @board = board
  end

  def play
    @board.populate_board
    display = Display.new(@board)
    while true
      begin
        system('clear')
        display.render
        display.cursor.get_input
      rescue Errorr => e
        puts e
        retry
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play
end
