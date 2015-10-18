require_relative "../models/computer.rb"

describe Computer do
  let(:player) { Player.new }
  let(:computer) { Computer.new }
  let(:board) { Board.new("X", "O", ["O", 1, "O", 3, "X", 5, 6, 7, 8]) }

  describe "#initialize" do
    it "sets the computer's marker" do
      expect(computer.marker).not_to be_falsey
    end
  end

  describe "#choose_move" do
    it "returns an integer representing the computer's best move" do
      expect(computer.choose_move(board, board.state)).to be_a(Integer)
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
      expect(computer.score(board, board.state)).to be_a(Integer)
    end
  end
end