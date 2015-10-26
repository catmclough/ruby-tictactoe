module TicTacToe
  class GameController < GameCreator

    def initialize(view, game)
      @view = view
      @game = game
      @player_one = game.player_one
      @player_two = game.player_two
      @board = Board.new(@player_one.marker, @player_two.marker)
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
      @view.puts "Player One: #{@player_one.marker}"
      @view.puts "Player Two: #{@player_two.marker}"
    end

    def draw_board(board_state)
      board_state.each_with_index do |mark, i|
        print "|_#{mark}_"
        puts "|\n" if i == 2 || i == 5 || i == 8
      end
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

    def play_round(first_player, second_player)
      display_round_screen
      @view.puts "#{@board.active_player(@board.state, first_player, second_player)}, you're up."

      if first_player.is_a?(Player)
        if second_player.is_a?(Computer)
          @view.puts "The computer has chosen space #{second_player.best_move}." if second_player.best_move
        end

        player_move(first_player)
        display_round_screen
      else
        choice = computer_move(first_player)
        display_round_screen
        @view.puts "The computer has chosen space #{second_player.best_move}." if second_player.best_move
      end

      unless over?
        @view.puts "#{@board.active_player(@board.state, first_player, second_player)}, you're up."
        computer_move(second_player) if second_player.is_a?(Computer)
        player_move(second_player) if second_player.is_a?(Player)
      end
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
      if @board.tie?(@board.state)
        end_of_tie_game(@board.state)
      else
        winner_message(@board.winner(@board.state), @board.state)
      end
    end

    def end_of_tie_game(state)
      clear_screen
      @view.puts "Game Over."
      draw_board(state)
      puts "CATS GAME."
    end

    def winner_message(winner, state)
      clear_screen
      puts "GAME OVER."
      draw_board(state)
      puts "#{winner} has won the game."
    end
  end
end