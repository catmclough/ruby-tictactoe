class GameView

  def display_opening_message
    puts "Welcome to my Tic Tac Toe game!"
  end

  def game_type
    puts "Please choose a game type:"
    puts "1. You vs. Computer"
    puts "2. 2-Player"
    puts "3. Computer vs. Computer"
    type = gets.chomp
  end

  def give_instructions
    print "Enter the number of the spot you'd like to select: "
  end

  def player_marker_entry(player)
    print "Player #{player.turn}, choose your marker: "
    choice = gets.chomp
  end

  def display_header(marker_one, marker_two)
    display_opening_message
    display_markers(marker_one, marker_two)
  end

  def invalid_marker_message
    puts "Invalid entry. Marker must be one character and cannot be a number or the same as your opponent's (FYI: The computer will always be 'X')."
  end

  def display_markers(player_one_marker, player_two_marker)
    puts "Player One: #{player_one_marker}"
    puts "Player Two: #{player_two_marker}"
    puts
  end

  def prompt_order_choice
    print "Player 1, would you like to go first or second? (Enter '1' for first, '2' for second): "
  end

  def draw_board(board_state)
    board_state.each_with_index do |mark, i|
      print "|_#{mark}_"
      puts "|\n" if i == 2 || i == 5 || i == 8
    end
    puts
  end

  def thinking_message
    puts "Examining all my options... this could take a minute."
  end

  def computer_choice_message(spot)
    puts "The computer has chosen space ##{spot}."
  end

  def incorrect_placement_error
    print "That's not an open spot on the board. Try again: "
  end

  def active_player_message(player)
    puts "#{player.marker}, you're up."
  end

  def end_of_tie_game(state)
    clear_screen
    puts "Game Over."
    draw_board(state)
    puts "Cats Game!"
  end

  def winner_message(winner, state)
    clear_screen
    puts "Game Over."
    draw_board(state)
    puts "#{winner} has won the game."
  end

  def clear_screen
    print "\e[2J"
  end
end