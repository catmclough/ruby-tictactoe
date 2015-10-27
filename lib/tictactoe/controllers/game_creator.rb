module TicTacToe
  class GameCreator
    attr_reader :game

    def initialize(view)
      @view = view
    end

    def clear_screen
      print "\e[2J"
    end

    def opening_message
      clear_screen
      @view.puts "Welcome to my Tic Tac Toe game!"
      game_type_options
    end

    def game_type_options
      @view.puts "Please choose a game type:"
      @view.puts "1. You vs. Computer"
      @view.puts "2. 2-Player"
      @view.puts "3. Computer vs. Computer"
    end

    def create_new_game(type)
      case type
      when '1'
        @game = ClassicGame.new
        ClassicGameController.new(@view, @game)
      when '2'
        @game = TwoPlayerGame.new
        TwoPlayerGameController.new(@view, @game)
      when '3'
        @game = TwoComputerGame.new
        TwoComputerGameController.new(@view, @game)
      else
        @view.puts "Invalid game type. Please choose 1, 2, or 3:"
        @game = nil
      end
    end
  end
end
