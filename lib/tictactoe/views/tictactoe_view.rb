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

    def marker_instructions
      "Marker cannot be a number or the same as the other player's marker."
    end

    def prompt_player_marker(player)
      "Player #{player} - Choose your marker: "
    end
end