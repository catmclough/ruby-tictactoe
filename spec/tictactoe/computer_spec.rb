require 'spec_helper'

module TicTacToe
  describe Computer do
    let(:game) { ClassicGame.new }
    let(:player) { game.player_one }
    let(:computer) { game.player_two }
    before { player.marker = "O" }
    before { player.turn = "1" }
    before { computer.turn = "2" }

    let(:board) { Board.new("O", "X", game, ["O", 1, "O", 3, "X", 5, 6, 7, 8]) }
    before(:example) { computer.instance_variable_set(:@first_turn_player, player) }
    before(:example) { computer.instance_variable_set(:@second_turn_player, computer) }

    describe "#initialize" do
      it "sets the computer's marker" do
        expect(computer.marker).not_to be_falsey
      end
    end

    describe "#turn" do
      it "sets the computer's turn" do
        computer.turn = '2'
        expect(computer.turn).to eq('2')
      end
    end

    describe "#choose_move" do
      it "returns an integer representing the computer's best move" do
        expect(computer.choose_move(board)).to be_a(Integer)
      end
    end

    describe "#minimax" do
      it "sets the @best_move variable" do
        computer.minimax(board, board.state)
        expect(computer.best_move).to be_a(Integer)
      end

      it "returns the board's avaiable spaces' highest score" do
        expect(computer.minimax(board, board.state)).to be_a(Integer)
      end
    end

    describe "#score" do
      it "returns 1 if the computer has won in the given board state" do
        expect(computer.score_spot(board, board.state)).to be_a(Integer)
      end
    end
  end
end