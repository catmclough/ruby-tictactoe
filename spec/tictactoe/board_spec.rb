require 'spec_helper'

module TicTacToe
  describe Board do
    let(:game) { ClassicGame.new }
    let(:board) { Board.new(game) }
    let(:horizontally_won_board) { Board.new(game, ["X", "X", "X", "O", 4, 5, "O", 7, "O"]) }
    let(:vertically_won_board) { Board.new(game, ["X", "O", 2, "X", 4, "O", "X", 7, "O"]) }
    let(:diagonally_won_board) { Board.new(game, ["X", "O", 2, 4, "X", "O", "O", 7, "X"]) }
    let(:incomplete_board) { Board.new(game, ["O", 1, 2, 3, 4, "O", "X", 7, 8]) }
    let(:cats_game) { Board.new(game, ["X", "O", "X", "O", "O", "X", "X", "X", "O"]) }

    describe "#initialize" do
      it "instantiates a board 'state' with 9 spaces" do
        expect(board.state.length).to eq(9)
      end
    end

    describe "#place_marker" do
      it "places a given marker at a given space" do
        board.place_marker(3, "C")
        expect(board.state[3]).to eq("C")
      end
    end

    describe "#winner" do
      context "'X' is the game winner on a horizontal row" do
        it "should return the winning marker" do
          expect(horizontally_won_board.winner(horizontally_won_board.state)).to eq("X")
        end
      end

      context "there is a game winner on a vertical row" do
        it "should return the winning marker" do
          expect(vertically_won_board.winner(vertically_won_board.state)).to eq("X")
        end
      end

      context "there is a game winner on a diagonal row" do
        it "should return the winning marker" do
          expect(diagonally_won_board.winner(diagonally_won_board.state)).to eq("X")
        end
      end

      context "the game has not been won" do
        it "should return nil" do
          expect(incomplete_board.winner(incomplete_board.state)).to be_nil
        end
      end
    end


    describe "#horizontal_winner" do
      context "game has been won on any horizontal row" do
        it "returns marker of winner" do
          expect(horizontally_won_board.horizontal_winner(horizontally_won_board.state)).to eq("X")
        end
      end

      context "game has not been won on any horizontal row" do
        it "returns nil" do
          expect(incomplete_board.horizontal_winner(incomplete_board.state)).to be_nil
        end
      end
    end

    describe "#vertical_winner" do
      context "game has been won on any vertical row" do
        it "returns marker of winner" do
          expect(vertically_won_board.vertical_winner(vertically_won_board.state)).to eq("X")
        end
      end

      context "game has not been won on any vertical row" do
        it "returns nil" do
          expect(incomplete_board.vertical_winner(incomplete_board.state)).to be_nil
        end
      end
    end

    describe "#diagonal_winner" do
      context "game has been won on a diagonal" do
        it "returns marker of winner" do
          expect(diagonally_won_board.diagonal_winner(diagonally_won_board.state)).to eq("X")
        end
      end

      context "game has not been won on a diagonal" do
        it "returns nil" do
          expect(incomplete_board.diagonal_winner(incomplete_board.state)).to be_nil
        end
      end
    end

    describe "#tie?" do
      context "game is a tie" do
        it "returns true" do
          expect(cats_game.tie?(cats_game.state)).to eq(true)
        end
      end

      context "game is not a tie" do
        it "returns false" do
          expect(horizontally_won_board.tie?(horizontally_won_board.state)).to eq(false)
        end
      end
    end

    describe "#full?" do
      context "the game board is full of markers" do
        it "should return true" do
          expect(cats_game.full?).to eq(true)
        end
      end

      context "the game board has unmarked spaces" do
        it "should return false" do
          expect(incomplete_board.full?).to eq(false)
        end
      end
    end

    describe "#get_open_spaces" do
      context "there are open spaces on the board" do
        it "should return true" do
          expect(incomplete_board.get_open_spaces(incomplete_board.state)).to eq([1, 2, 3, 4, 7, 8])
        end
      end

      context "there are not open spaces on the board" do
        it "should return an empty array" do
          expect(cats_game.get_open_spaces(cats_game.state)).to eq([])
        end
      end
    end

    describe "#active_player" do
      it "returns the player who's turn it is" do
        player_one = Player.new
        player_one.turn = '1'
        player_one.marker = "O"
        player_two = Computer.new
        player_two.turn = '2'

        expect(incomplete_board.active_player(incomplete_board.state)).to eq("X")
      end
    end
  end
end