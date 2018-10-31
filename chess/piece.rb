require_relative "sliding_piece.rb"
require_relative "stepping_piece.rb"
require_relative "board.rb"

require "Singleton"

class Piece

  attr_reader :board, :start_pos, :color
  def initialize(start_pos, color, board)
    @start_pos = start_pos
    @color = color
    @board = board
  end

  def value
    "-"
  end


end

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :no_color
    @symbol = :no_sym
  end

  def value
    "N"
  end
end

class Bishop < Piece
  # attr_reader :value
  include SlidingPiece
  attr_reader :current_pos
  def initialize(start_pos, color, board)
    super(start_pos, color, board)
    @current_pos = @start_pos
    @move_dirs = [:diagonal]
    # @value = "B"
  end


  def moves(move_dirs, current_pos, board)
  end

  def value
    return "B"
  end
  # def inspect
  #   "B"
  # end
end

class Rook < Piece
  include SlidingPiece
  attr_reader :current_pos
  def initialize(start_pos, color, board)
    super(start_pos, color, board)
    @current_pos = @start_pos
    @move_dirs = [:horizontal, :vertical]
  end


  def moves(move_dirs, current_pos, board)
  end

  def value
    "R"
  end
end

class Queen < Piece
  include SlidingPiece
  attr_reader :current_pos
  def initialize(start_pos, color, board)
    super(start_pos, color, board)
    @current_pos = @start_pos
    @move_dirs = [:diagonal,:horizontal, :vertical]
  end


  def moves(move_dirs, current_pos, board)
  end

  def value
    "Q"
  end
end

######################

class King < Piece
  include SteppingPiece
  attr_reader :current_pos
  def initialize(start_pos, color, board)
    super(start_pos, color, board)
    @current_pos = @start_pos
    @move_dirs = [:step]
  end


  def moves(move_dirs, current_pos, board)
  end

  def value
    "K"
  end
end

class Knight < Piece
  include SteppingPiece
  attr_reader :current_pos
  def initialize(start_pos, color, board)
    super(start_pos, color, board)
    @current_pos = @start_pos
    @move_dirs = [:jump]
  end


  def moves(move_dirs, current_pos, board)
  end

  def value
    "N"
  end
end
