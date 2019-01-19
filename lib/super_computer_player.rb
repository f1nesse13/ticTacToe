require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    if node.children.any? { |node| node.winning_node?(mark)}
      node.children.each do | child |
        if child.winning_node?(mark)
          return child.prev_move_pos
        end
      end
    end

      node.children.each do | child |
        if !child.losing_node?(mark)
          return child.prev_move_pos
        end
      end
    raise "No moves that result in a win or draw"
  end


end
if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
