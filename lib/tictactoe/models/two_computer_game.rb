module TicTacToe
  class TwoComputerGame
    attr_reader :player_one, :player_two

    def initialize
      @player_one = Computer.new
      @player_two = Computer.new("O")
      @player_one.turn = '1'
      @player_one.turn = '2'
      @player_one.opponent = @player_two
      @player_two.opponent = @player_one
    end

    def first_turn_player
      @player_one.turn == '1' ? @player_one : @player_two
    end

    def second_turn_player
      @player_one.turn == '2' ? @player_one : @player_two
    end

  end
end