require_relative 'piece.rb'
require 'byebug'

class InvalidStartPos < StandardError
end
class InvalidEndPos < StandardError
end



class Board
  attr_reader :grid

  # @null = NullPiece.instance

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
    @null =  NullPiece.instance
  end

  def populate_board
    # debugger
    first_row =[Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]


    # b1 = Bishop.new([1,1], :white, self)
    # temp =
    # @grid[0..1] + @grid[6..7]
    ([0,1,6,7]).each do |row|
      (0...8).each do |i|
        @grid[row][i] = first_row[i].new([row,i],:White, self)
      end
    end

    (@grid[2..5]).each do |row|
      (0...row.length).each do |i|
        row[i] = @null
      end
    end


    # add_piece(b1,[1,1])
  end

  def valid_pos?(pos)
    row, col = pos
    return false if row > 7 || row < 0
    return false if col > 7 || col  < 0
    return true
  end


  def move_piece(start_pos,end_pos)
    raise InvalidStartPos.new if self[start_pos].is_a?(NullPiece)
    # raise InvalidEndPos.new if valid_move?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NULL

  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,piece)
    row,col = pos
    @grid[row][col] = piece
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end


end
