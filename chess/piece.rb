
class Piece

  def intialize
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
