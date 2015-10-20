class Player
  attr_accessor :marker, :turn

  def initialize(turn = '1')
    @turn = turn
  end

  def choose_turn
    turn_choice = gets.chomp
    if turn_choice == '2'
      @turn = turn_choice
    else
      @turn  = '1'
    end
  end

  def choose_spot(board)
    spot = gets.chomp
    return nil if Player.invalid_move?(spot, board)
    spot
  end

  def self.invalid_marker?(entry, opponent_marker = nil)
    entry.length == 0 || /\A\d+\z/.match(entry) != nil || entry.length > 1 || entry == opponent_marker
  end

  def self.invalid_move?(spot, board_state)
    !("0".."8").include?(spot) || !("0".."8").include?(board_state[spot.to_i].to_s)
  end
end
