require_relative '../models/computer'
require_relative '../models/player'
require_relative '../models/board'
require_relative '../views/game_view'

class GameController
  def initialize
    @game_view = GameView.new
    set_game_type
    @board = Board.new(@player_two.marker, @player_one.marker)
  end

  def set_game_type
    @game_view.display_opening_screen

    case @game_view.select_game_type
    when '1'
      create_player_vs_computer_game
    when '2'
      create_two_player_game
    when '3'
      create_two_computer_game
    end
  end

  def create_player_vs_computer_game
    @player_one = Player.new
    @player_two = Computer.new
    set_player_marker(@player_one, @player_two.marker)
  end

  def create_two_player_game
    @player_one = Player.new
    set_player_marker(@player_one)
    @player_two = Player.new('2')
    set_player_marker(@player_two, @player_one.marker)
  end

  def create_two_computer_game
    @player_one = Computer.new
    @player_two = Computer.new("O")
  end

  def start_game
    @game_view.display_opening_screen
    prompt_turn_selection
    @game_view.display_header(@player_one.marker, @player_two.marker)
    @game_view.draw_board(@board.state)
    play_game
  end

  def prompt_turn_selection
    if @player_one.is_a?(Player) || @player_two.is_a?(Player)
      @game_view.prompt_order_choice
      @player_one.choose_turn
      @player_one.turn == '1' ? @player_two.turn = '2' : @player_two.turn = '1'
    end
  end

  def set_player_marker(player, opponent_marker = nil)
    player_marker = @game_view.player_marker_entry(player)
    validate_player_marker(player_marker, opponent_marker)
    player.marker = player_marker
  end

  def play_game
    if @player_one.turn == '1'
      first_turn = @player_one
      second_turn = @player_two
    else
      first_turn = @player_two
      second_turn = @player_one
    end

    until @board.winner(@board.state) || @board.tie?(@board.state)
      play_round(first_turn, second_turn)
    end
    end_game
  end

  def validate_player_marker(player_marker, opponent_marker)
    while Player.invalid_marker?(player_marker, opponent_marker)
      @game_view.invalid_marker_message
      player_marker = @game_view.player_marker_entry(player)
    end
  end

  def play_round(first_player, second_player)
    @game_view.clear_screen
    @game_view.display_header(first_player.marker, second_player.marker)
    @game_view.draw_board(@board.state)
    @game_view.active_player_message(first_player)

    if first_player.is_a?(Player)
      if second_player.is_a?(Computer)
        @game_view.computer_choice_message(second_player.best_move) if second_player.best_move
      end

      player_move(first_player)
      @game_view.clear_screen
      @game_view.display_header(first_player.marker, second_player.marker)
      @game_view.draw_board(@board.state)
    else
      choice = computer_move(first_player)
      @game_view.clear_screen
      @game_view.display_header(first_player.marker, second_player.marker)
      @game_view.draw_board(@board.state)
      @game_view.computer_choice_message(choice)
    end

    unless over?
      @game_view.active_player_message(second_player)
      computer_move(second_player) if second_player.is_a?(Computer)
      player_move(second_player) if second_player.is_a?(Player)
    end
  end

  def player_move(player)
    @game_view.display_move_instructions
    choice = player.choose_spot(@board.state)
    until choice
      @game_view.incorrect_placement_error
      choice = player.choose_spot(@board.state)
    end
    @board.place_marker(choice, player.marker)
  end

  def computer_move(player)
    @game_view.thinking_message
    choice = player.choose_move(@board, @board.state)
    @board.place_marker(choice, player.marker)
    choice
  end

  def over?
    @board.winner(@board.state) || @board.tie?(@board.state)
  end

  def end_game
    if @board.tie?(@board.state)
      @game_view.end_of_tie_game(@board.state)
    else
      @game_view.winner_message(@board.winner(@board.state), @board.state)
    end
  end
end
