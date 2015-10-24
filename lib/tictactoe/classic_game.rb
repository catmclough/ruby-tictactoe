module TicTacToe
  class ClassicGame
    def initialize
      @player_one = Player.new
      @player_two = Computer.new
    end

    def player_marker_prompt
      return "Player One - Choose your marker: "
    end

    def set_player_marker(choice)
      if @player_one.validate_player_marker(choice, @player_two.marker)
        @player_one.marker = choice
      else
        return false
      end
    end
  end
end