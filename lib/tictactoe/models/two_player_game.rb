module TicTacToe
  class TwoPlayerGame
    attr_reader :player_one, :player_two

    def initialize
      @player_one = Player.new
      @player_two = Player.new
    end

    def set_player_marker(player, choice)
      if player == 1 && player_one.validate_marker(choice, player_two.marker)
        player_one.marker = choice
      elsif player == 2 && player_two.validate_marker(choice, player_two.marker)
        player_two.marker = choice
      else
        return false
      end
    end

    def valid_turn_choice?(choice)
      choice == player_one.marker || choice == player_two.marker ? true : false
    end

    def set_turns(choice)
      if choice == player_one.marker
        player_one.turn = '1'
        player_two.turn = '2'
      else
        player_one.turn = '2'
        player_two.turn = '1'
      end
    end

    def first_turn_player
      player_one.turn == '1' ? player_one : player_two
    end

    def second_turn_player
      player_one.turn == '2' ? player_one : player_two
    end
  end
end
