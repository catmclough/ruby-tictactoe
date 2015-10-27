module TicTacToe
  class TwoComputerGameController < GameController
    def initialize(view, game)
      super(view, game)
    end

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
          @view.puts "#{active_player.marker}, you're up."
            computer_move(active_player)
            display_round_screen
          @view.puts "The computer has chosen space #{active_player.best_move}." if active_player.best_move
        end
        active_player, opponent = opponent, active_player
      end
    end
  end
end