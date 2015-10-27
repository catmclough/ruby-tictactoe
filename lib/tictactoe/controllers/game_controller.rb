module TicTacToe
  class GameController < GameCreator

    def initialize(view, game)
      @view = view
      @game = game
      @player_one = game.player_one
      @player_two = game.player_two
      @board = Board.new(@game)
    end

    def prompt_player_marker(player)
      @view.print "Player #{player} - Choose your marker: "
    end

    def choose_player_marker(player)
      marker_choice = gets.chomp
      until @game.set_player_marker(player, marker_choice)
        invalid_marker_choice
        prompt_player_marker(player)
        marker_choice = gets.chomp
      end
    end

    def invalid_marker_choice
      @view.puts "Invalid entry. Marker must be one character and cannot be a number or the same as your opponent's (FYI: The computer will always be 'X')."
    end

    def set_player_turns
      prompt_turn_selection
      choose_turns
    end

    def set_turn(choice)
      @game.set_turns(choice)
    end

    def invalid_turn_choice_message
      @view.puts"Invalid Turn Choice."
    end

    def start_game
      display_round_screen
      play_game
    end

    def display_round_screen
      clear_screen
      display_game_type
      display_player_markers
      draw_board(@board.state)
    end

    def display_game_type
      game_types = {ClassicGame => "You vs. Computer",
                    TwoPlayerGame => "Two Player",
                    TwoComputerGame => "Two Computers" }
      @view.puts "Game Type: #{game_types[game.class]}"
    end

    def display_player_markers
      @view.puts "Player One: #{@game.first_turn_player.marker}"
      @view.puts "Player Two: #{@game.second_turn_player.marker}"
    end

    def draw_board(board_state)
      board_state.each_with_index do |mark, i|
        print "|_#{mark}_"
        puts "|\n" if i == 2 || i == 5 || i == 8
      end
    end

    def play_game
      until @board.winner(@board.state) || @board.tie?(@board.state)
        play_round(@game.first_turn_player, @game.second_turn_player)
      end
      end_game
    end

    def player_move(player)
      @view.puts "Enter the number of the spot you'd like to select: "
      choice = player.choose_spot(@board.state)
      until choice
        @view.print "That's not an open spot on the board. Try again: "
        choice = player.choose_spot(@board.state)
      end
      @board.place_marker(choice, player.marker)
    end

    def computer_move(player)
      @view.puts "Examining all my options... this could take a minute."
      choice = player.choose_move(@board)
      @board.place_marker(choice, player.marker)
      choice
    end

    def over?
      @board.winner(@board.state) || @board.tie?(@board.state)
    end

    def end_game
      clear_screen
      @view.puts "GAME OVER."
      draw_board(@board.state)
      if @board.tie?(@board.state)
        @view.puts "CATS GAME."
      else
        @view.puts "#{@board.winner(@board.state)} has won the game."
      end
    end
  end
end
