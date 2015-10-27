module TicTacToe
  class ClassicGameController < GameController

    def initialize(view, game)
      super(view, game)
    end

    def set_markers
      prompt_player_marker(1)
      choose_player_marker(1)
    end

    def prompt_turn_selection
      @view.print "Would you like to go first or second? (Enter 1 or 2): "
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
          @view.puts "#{active_player.marker}, you're up."
          if active_player.is_a?(Player)
            player_move(active_player)
            display_round_screen
          else
            choice = computer_move(active_player)
            display_round_screen
            @view.puts "The computer has chosen space #{active_player.best_move}." if active_player.best_move
          end
          active_player, opponent = opponent, active_player
        end
      end
    end

  end
end