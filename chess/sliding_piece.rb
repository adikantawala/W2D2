module SlidingPiece

  def move_left(current_pos)
    row, col = current_pos
    col -= 1
    return [row,col]
  end
  def move_right(current_pos)
    row, col = current_pos
    col += 1
    return [row,col]
  end
  def move_up(current_pos)
    row, col = current_pos
    row -= 1
    return [row,col]
  end
  def move_down(current_pos)
    row, col = current_pos
    row += 1
    return [row,col]
  end

  def moves(move_dirs, current_pos, board)
    case move_dirs
    when [:diagonal]
      get_diag_moves(current_pos)
    when [:horizontal, :vertical]
      get_row_move(current_pos) + get_col_move(current_pos)
    else
      get_row_move(current_pos) + get_col_move(current_pos) + get_diag_moves(current_pos)
    end
  end

  def hit_piece?(current_pos,board)
    row, col = current_pos
    return board[current_pos].is_a?(Piece)
  end

  def same_color?(new_pos,current_pos,board)
    board[temp].color == board[current_pos].color
  end

  def out_of_bounds?(current_pos)
    row, col = current_pos
    return !row.between?(0,7) || !col.between?(0,7)
  end



  def get_row_move(current_pos, board)
    final = []
    new_pos = current_pos

    while true
      new_pos = move_left(new_pos)
      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    new_pos = current_pos
    while true
      new_pos = move_right(new_pos)
      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    return final
  end



  def get_col_move(current_pos)
    final = []
    new_pos = current_pos
    while true
      new_pos = move_up(new_pos)
      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    new_pos = current_pos

    while true
      new_pos = move_down(new_pos)
      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    return final
  end

  def get_diag_moves(current_pos)
    final = []
    new_pos = current_pos
    while true
      new_pos = move_up(new_pos)
      new_pos = move_left(new_pos)

      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    new_pos = current_pos

    while true
      new_pos = move_up(new_pos)
      new_pos = move_right(new_pos)

      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    new_pos = current_pos
    while true
      new_pos = move_down(new_pos)
      new_pos = move_left(new_pos)

      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end



    new_pos = current_pos

    while true
      new_pos = move_down(new_pos)
      new_pos = move_right(new_pos)

      if out_of_bounds?(new_pos)
        break
      elsif hit_piece?(new_pos, board)
        if same_color?(new_pos,current_pos,board)
          break
        else
          final << new_pos
          break
        end
      else
        final << new_pos
      end
    end

    return final

  end



end
