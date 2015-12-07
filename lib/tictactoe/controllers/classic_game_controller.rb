module TicTacToe
  class ClassicGameController < GameController

    def set_markers
      prompt_player_marker(1)
      choose_player_marker(1)
    end

    def prompt_turn_selection
      @output.print(@view.prompt_turn_selection)
    end

    def choose_turns
      choice = gets.chomp
      until @game.valid_turn_choice?(choice)
        invalid_turn_choice_message
        prompt_turn_selection
        choice = gets.chomp
      end
      set_turn(choice)
    end

    def play_round(active_player, opponent)
      2.times do
        unless over?
          @output.puts(@view.turn_prompt(active_player.marker))
          if active_player.is_a?(Player)
            player_move(active_player)
            display_round_screen
          else
            choice = computer_move(active_player)
            display_round_screen
            @output.puts(@view.computer_move_complete(active_player.best_move)) if active_player.best_move
          end
          active_player, opponent = opponent, active_player
        end
      end
    end

  end
end