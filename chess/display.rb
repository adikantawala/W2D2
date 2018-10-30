require "colorize"
require 'byebug'
require_relative "cursor.rb"
require_relative "board.rb"

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
          print "N".colorize(:background => :light_blue)
        elsif el.class == Piece && i1 == row && i2 == col
          print "P".colorize(:background =>:light_blue)
        elsif el.class == NullPiece
          print "N".colorize(:red)
        else
          print "P".colorize(:red)
        end
      end
      puts
    end
    puts "------------------------"
  end

end
