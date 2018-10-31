module SteppingPiece

  def moves(move_dirs, current_pos, board)
    case move_dirs
    when [:step]
      king_moves(current_pos)
    when [:jump]
      knight_moves(current_pos)
    end
  end

  def knight_moves(board, move, current_pos)
    x, y = current_pos
    results = [
      [x + 1, y + 1],
      [x + 0, y + 1],
      [x - 1, y + 1],
      [x - 1, y + 0],
      [x - 1, y - 1],
      [x + 0, y - 1],
      [x + 1, y - 1],
      [x + 1, y + 0]
    ]

    result.select { |move| valid_move?(board, move, current_pos) }
  end

  def knight_moves(board, move, current_pos)
    x, y = current_pos
    results = [
      [x - 2, y + 1],
      [x - 1, y + 2],
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x - 2, y - 1]
    ]

    result.select { |move| valid_move?(board, move, current_pos) }
  end

  def valid_move?(board, move, current_pos)
    x, y = move
    return true if x.between?(0, 7) && y.between?(0, 7) && board[move].color != board[current_pos].color
    return false
  end



end
