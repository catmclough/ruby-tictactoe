module TicTacToe
  class TwoComputerGame
    attr_reader :player_one, :player_two

    def initialize
      @player_one = Computer.new
      @player_two = Computer.new
    end
  end
end