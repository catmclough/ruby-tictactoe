module TicTacToe
  class ClassicGame
    attr_reader :player_one, :player_two

    def initialize
      @player_one = Player.new
      @player_two = Computer.new
    end

    def set_player_marker(player, choice)
      if @player_one.validate_marker(choice, @player_two.marker)
        @player_one.marker = choice
      else
        return false
      end
    end

    def valid_turn_choice?(choice)
      choice == '1' || choice == '2' ? true : false
    end

    def set_turns(player_one_turn)
      @player_one.turn == player_one_turn
    end

  end
end