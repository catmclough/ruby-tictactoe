module TicTacToe
  class Board
    attr_reader :state

    def initialize(player_one_marker, player_two_marker, state = (0..8).to_a)
      @player_one_marker = player_one_marker
      @player_two_marker = player_two_marker
      @state = state
    end

    def place_marker(choice, marker)
      @state[choice.to_i] = marker
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

    def tie?(board)
      !winner(board) && full?
    end

    def full?
      @state.all? { |space| !(/\A\d+\z/.match(space.to_s)) }
    end

    def get_open_spaces(board)
      board.select { |s| s != @player_one_marker && s != @player_two_marker }
    end

    def active_player(board_state, player_one_turn)
      if player_one_turn == '1'
        if board_state.count(@player_one_marker) <= board_state.count(@player_two_marker)
          return @player_one_marker
        else
          return @player_two_marker
        end
      else
        if board_state.count(@player_one_marker) < board_state.count(@player_two_marker)
          return @player_one_marker
        else
          return @player_two_marker
        end
      end
    end
  end
end