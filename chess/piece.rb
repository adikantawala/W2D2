
class Piece

  def intialize(start_pos, color, board)
    @color
  end

  def inspect
    "P"
  end
end

class NullPiece < Piece
  # include Singleton
  def inspect
    "N"
  end
end
