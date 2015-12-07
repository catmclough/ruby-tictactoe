module TicTacToe
  class GameCreator
    attr_reader :game

    def initialize(args)
      @output = args.fetch(:output)
      @view = args.fetch(:view)
    end

    def clear_screen
      print "\e[2J"
    end

    def opening_message
      clear_screen
      @output.puts(@view.opening_message)
      game_type_options
    end

    def game_type_options
      @output.puts(@view.game_type_options)
    end

    def create_new_game(type)
      case type
      when '1'
        @game = ClassicGame.new
        ClassicGameController.new({output: @output, view: @view, game: @game})
      when '2'
        @game = TwoPlayerGame.new
        TwoPlayerGameController.new({output: @output, view: @view, game: @game})
      when '3'
        @game = TwoComputerGame.new
        TwoComputerGameController.new({output: @output, view: @view, game: @game})
      else
        @output.puts(@view.invalid_entry)
        # game_type_options
        @game = nil
      end
    end
  end
end
