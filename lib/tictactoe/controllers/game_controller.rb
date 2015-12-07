module TicTacToe
  class GameController < GameCreator

    attr_reader :game, :board, :view

    def initialize(args = {})
      @output = args.fetch(:output)
      @view = args.fetch(:view)
      @game = args.fetch(:game)
      @player_one = game.player_one
      @player_two = game.player_two
      @board = Board.new(@game)
    end

    def prompt_player_marker(player)
      @output.print(@view.prompt_player_marker(player))
    end

    def choose_player_marker(player)
      marker_choice = gets.chomp
      until game.set_player_marker(player, marker_choice)
        invalid_marker_choice
        prompt_player_marker(player)
        marker_choice = gets.chomp
      end
    end

    def invalid_marker_choice
      @output.puts(@view.invalid_entry)
      @output.puts(@view.marker_instructions)
    end

    def set_player_turns
      prompt_turn_selection
      choose_turns
    end

    def set_turn(choice)
      game.set_turns(choice)
    end

    def invalid_turn_choice_message
      @output.puts(@view.invalid_entry)
    end

    def start_game
      display_round_screen
      play_game
    end

    def display_round_screen
      clear_screen
      display_game_type
      display_player_markers
      draw_board(board.state)
    end

    def display_game_type
      game_types = {ClassicGame => "You vs. Computer",
                    TwoPlayerGame => "Two Player",
                    TwoComputerGame => "Two Computers" }
      @output.puts(@view.game_type(game_types[game.class]))
    end

    def display_player_markers
      @output.puts(@view.marker_info(1, game.first_turn_player.marker))
      @output.puts(@view.marker_info(2, game.second_turn_player.marker))
    end

    def draw_board(board_state)
      board_state.each_with_index do |mark, i|
        @output.print "|_#{mark}_"
        @output.puts "|\n" if i == 2 || i == 5 || i == 8
      end
    end

    def play_game
      until board.winner(board.state) || board.tie?(board.state)
        play_round(game.first_turn_player, game.second_turn_player)
      end
      end_game
    end

    def player_move(player)
      @output.puts(@view.prompt_move)
      choice = player.choose_spot(board.state)
      until choice
        @output.puts(@view.invalid_entry)
        choice = player.choose_spot(board.state)
      end
      board.place_marker(choice, player.marker)
    end

    def computer_move(player)
      @output.puts(@view.thinking_message)
      choice = player.choose_move(board)
      board.place_marker(choice, player.marker)
      choice
    end

    def over?
      board.winner(board.state) || board.tie?(board.state)
    end

    def end_game
      @output.clear_screen
      @output.puts(@view.game_over)
      draw_board(board.state)
      if board.tie?(board.state)
        @output.puts(@view.cats_game)
      else
        @output.puts(@view.winning_message(board.winner(board.state)))
      end
    end
  end
end
