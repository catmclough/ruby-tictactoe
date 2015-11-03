module TicTacToe
  class Board
    attr_reader :state, :game

    def initialize(game, state = (0..8).to_a)
      @game = game
      @state = state
    end

    def place_marker(choice, marker)
      state[choice.to_i] = marker
    end

    def winner(board)
      return horizontal_winner(board) if horizontal_winner(board)
      return vertical_winner(board) if vertical_winner(board)
      return diagonal_winner(board) if diagonal_winner(board)
    end

    def horizontal_winner(board)
      board.each_slice(3) do |i|
        return i[0] if i.uniq.length == 1
      end
      nil
    end

    def vertical_winner(board)
      sliced_board = slice_board(board)
      sliced_board.transpose.each do |i|
        return i[0] if i.uniq.length == 1
      end
      nil
    end

    def diagonal_winner(board)
      diagonal_one = [board[0], board[4], board[8]]
      diagonal_two = [board[2], board[4], board[6]]

      if diagonal_one.uniq.length == 1
        return board[0]
      elsif diagonal_two.uniq.length == 1
        return board[2]
      else
        return nil
      end
    end

    def slice_board(board)
      sliced_board = []
      board.each_slice(3) do |i|
        sliced_board << i
      end
      sliced_board
    end

    def active_player(board_state)
      if board_state.count(game.first_turn_player.marker) <= board_state.count(game.second_turn_player.marker)
        return game.first_turn_player.marker
      else
        return game.second_turn_player.marker
      end
    end

    def tie?(board)
      !winner(board) && full?
    end

    def full?
      state.all? { |space| !(/\A\d+\z/.match(space.to_s)) }
    end

    def get_open_spaces(board)
      board.select { |s| s.is_a?(Integer) }
    end
  end
end