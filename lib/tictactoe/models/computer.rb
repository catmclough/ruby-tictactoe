module TicTacToe
  class Computer
    attr_accessor :opponent, :turn, :marker, :best_move

    def initialize
      @opponent = opponent
    end

    def choose_move(board)
      self.best_move = nil
      minimax(board, board.state)
      best_move
    end

    def minimax(board, board_state)
      if board.winner(board_state) || board.tie?(board_state)
        return score_spot(board, board_state)
      end

      scores = []
      moves = []
      score_hypothetical_moves(board, board_state, scores, moves)

      if board.active_player(board_state) == marker
        max_score_index = get_max_index(scores)
        self.best_move = moves[max_score_index]
        return scores[max_score_index]
      else
        min_score_index = get_min_index(scores)
        self.best_move = moves[min_score_index]
        return scores[min_score_index]
      end
    end

    def score_hypothetical_moves(board, board_state, scores, moves)
      available_spaces = board.get_open_spaces(board_state)

      available_spaces.each do |space|
        possible_board_state = board_state.dup
        possible_board_state[space] = board.active_player(possible_board_state)

        scores << minimax(board, possible_board_state).to_i
        moves << space
      end
    end

    def get_max_index(scores)
      scores.index(scores.max) || 0
    end

    def get_min_index(scores)
      scores.index(scores.min) || 0
    end

    def score_spot(board, board_state)
      if board.winner(board_state) == marker
        return 1
      elsif board.winner(board_state)
        return -1
      else
        return 0
      end
    end
  end
end