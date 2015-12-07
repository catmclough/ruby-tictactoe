module TicTacToe
  class TicTacToeView
      def opening_message
        "Welcome to Tic-Tac-Toe!"
      end

      def game_type_options
        "Please choose a game type (Enter 1, 2, or 3):\n
        1. You vs. Computer\n
        2. 2-Player\n
        3. Computer vs. Computer"
      end

      def invalid_entry
        "Invalid entry."
      end

      def game_type(name)
        "Game Type: #{name}"
      end

      def marker_instructions
        "Marker cannot be a number or the same as the other player's marker."
      end

      def prompt_player_marker(player)
        "Player #{player} - Choose your marker: "
      end

      def marker_info(player, player_marker)
        if player == 1
          return "Player One: #{player_marker}"
        elsif player == 2
          return "Player Two: #{player_marker}"
        end
      end

      def prompt_turn_selection
        "Would you like to go first or second? (Enter 1 or 2): "
      end

      def first_turn_selection
        "Enter the marker of the player who will go first: "
      end

      def prompt_move
        "Enter the number of the spot you'd like to select: "
      end

      def turn_prompt(player)
        "#{player}, you're up."
      end

      def computer_move_complete(move)
        "The computer has chosen space #{move}."
      end

      def thinking_message
        "Examining all my options... this could take a minute."
      end

      def game_over
        "GAME OVER."
      end

      def cats_game
        "CATS GAME."
      end

      def winning_message(winner)
        "#{winner} has won the game."
      end
  end
end