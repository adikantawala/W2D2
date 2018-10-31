require "colorize"
require 'byebug'
require_relative "cursor.rb"
require_relative "board.rb"
require_relative "sliding_piece.rb"
require_relative "stepping_piece.rb"

class Display

  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    row , col = @cursor.cursor_pos
    # debugger
    @board.grid.each_with_index do |each_row, i1|
      each_row.map.with_index do |el, i2|
        if el.class == NullPiece &&
        i1 == row && i2 == col
          print "-".colorize(:background =>:blue)
        elsif el.class == Bishop && i1 == row && i2 == col
          print el.value.colorize(:background =>:blue)
        elsif el.class == Rook && i1 == row && i2 == col
          print el.value.colorize(:background =>:blue)elsif el.class == Knight && i1 == row && i2 == col
            print el.value.colorize(:background =>:blue)elsif el.class == King && i1 == row && i2 == col
              print el.value.colorize(:background =>:blue)elsif el.class == Queen && i1 == row && i2 == col
                print el.value.colorize(:background =>:blue)
        elsif el.class == NullPiece
          print "-".colorize(:red)
        else
          print el.value.colorize(:red)
        end
      end
      puts
    end
    puts "------------------------"
  end

end
