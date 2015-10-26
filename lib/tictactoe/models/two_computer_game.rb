module TicTacToe
  class TwoComputerGame
    attr_reader :player_one, :player_two

    def initialize
      @player_one = Computer.new
      @player_two = Computer.new
    end

    # def set_turns(player_one_turn)
    #   @player_one = player_one_turn
    #   @player_one.turn == '1' ? @player_two.turn = '2' : @player_two.turn = '1'
    # end
  end
end