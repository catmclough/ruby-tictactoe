module TicTacToe
  class TwoComputerGameController < GameController

    def set_markers
      @player_one.marker = "X"
      @player_two.marker = "O"
    end

    def set_player_turns
      @player_one.turn = '1'
      @player_two.turn = '2'
    end

    def play_round(active_player, opponent)
      2.times do
        unless over?
          @output.puts(@view.turn_prompt(active_player.marker))
            computer_move(active_player)
            display_round_screen
          @output.puts(@view.computer_move_complete(active_player.best_move)) if active_player.best_move
        end
        active_player, opponent = opponent, active_player
      end
    end
  end
end