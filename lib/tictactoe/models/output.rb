module TicTacToe
  class Output
    def print(message)
      STDOUT.print(message)
    end

    def puts(message)
      STDOUT.puts(message)
    end

    def clear_screen
      STDOUT.print "\e[2J"
    end
  end
end