module SlidingPiece

  def moves(move_dirs, current_pos)
    case move_dirs
    when [:diagonal]
      get_diag_moves(current_pos)
    when [:horizontal, :vertical]
      get_row_move(current_pos) + get_col_move(current_pos)
    else
      get_row_move(current_pos) + get_col_move(current_pos) + get_diag_moves(current_pos)
    end
  end

  def get_row_move(current_pos)
    row = current_pos[0]
    moves = []
    (0...8).each do |col|
      moves << [row,col]
    end
    return moves - [current_pos]
  end

  def get_col_move(current_pos)
    col = current_pos[1]
    moves = []
    (0...8).each do |row|
      moves << [row,col]
    end
    return moves - [current_pos]
  end

  def get_diag_moves(current_pos)
    up_right(current_pos) + up_left(current_pos) + down_left(current_pos) + down_right(current_pos)
  end

  def up_right(current_pos)
    final = []
    row, col = current_pos
    until row < 0 || col > 7
      row -= 1
      col += 1
      final << [row, col]
    end
    return final
  end

  def up_left(current_pos)
    final = []
    row, col = current_pos
    until row < 0 || col < 0
      row -= 1
      col -= 1
      final << [row, col]
    end
    return final
  end

  def down_right(current_pos)
    final = []
    row, col = current_pos
    until row > 7 || col > 7
      row += 1
      col += 1
      final << [row, col]
    end
    return final
  end

  def down_left(current_pos)
    final = []
    row, col = current_pos
    until row > 7 || col < 0
      row += 1
      col -= 1
      final << [row, col]
    end
    return final
  end


end
