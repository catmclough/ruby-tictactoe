module TicTacToe
  class TwoPlayerGame
    attr_reader :player_one, :player_two

    def initialize
      @player_one = Player.new
      @player_two = Player.new
    end

    def set_player_marker(player, choice)
      if player == 1
        if @player_one.validate_marker(choice, @player_two.marker)
          @player_one.marker = choice
        else
          return false
        end
      else
        if @player_one.validate_marker(choice, @player_two.marker)
          @player_one.marker = choice
        else
          return false
        end
      end
    end
  end
end