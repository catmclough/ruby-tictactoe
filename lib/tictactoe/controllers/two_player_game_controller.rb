module TicTacToe
  class TwoPlayerGameController < GameController
    def initialize(view, game)
      super(view, game)
    end

    def set_markers
      prompt_player_marker(1)
      choose_player_marker(1)
      prompt_player_marker(2)
      choose_player_marker(2)
    end

    def prompt_player_marker(player)
      @view.print "Player #{player} - Choose your marker: "
    end

    def choose_player_marker(player)
      marker_choice = gets.chomp
      until @game.set_player_marker(player, marker_choice)
        invalid_marker_choice
        prompt_player_marker(player)
        marker_choice = gets.chomp
      end
    end

    def prompt_turn_selection
      @view.print "Enter the marker of the player who will go first: "
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
            player_move(active_player)
            display_round_screen
        end
        active_player, opponent = opponent, active_player
      end
    end

  end
end