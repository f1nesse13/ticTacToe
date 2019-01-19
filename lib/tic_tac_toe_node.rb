require_relative 'tic_tac_toe'

class TicTacToeNode

attr_reader :board, :prev_move_pos, :next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    move_array = []
    board.rows.each_with_index do | row, r_idx |
      row.each_with_index do |col, c_idx|
        # Gets each position based off of board
        pos = [r_idx, c_idx]
        # checks if a value has been given to the square
        if col.nil?
          # duplicates the board and adds a x or o  - also logs the position for the previous move
          board_dup = board.dup
          board_dup[pos] = self.next_mover_mark
          prev_move_pos = pos
          marker = next_mover_mark == :x ? :o : :x
          move_array << TicTacToeNode.new(board_dup, marker, pos)
        end
      end
    end
    move_array
  end
end
