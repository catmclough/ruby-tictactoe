require 'spec_helper'

module TicTacToe
  describe Player do
    let(:game) { ClassicGame.new }
    let(:player) { game.player_one }
    let(:test_board) { Board.new("X", "O", game, ["X", "X", 2, 3, 4, "O", 6, "O", "O"]) }

    describe "#choose_turn" do
      it "returns 'the player's choice of turn as a string" do
        expect(player).to receive(:gets).and_return('2')
        expect(player.choose_turn).to eq('2')
      end

      it "sets player one's turn to '1' if player chooses any other turn than '2'" do
        expect(player).to receive(:gets).and_return('3')
        player.choose_turn
        expect(player.turn).to eq('1')
      end
    end

    describe "#choose_spot" do
      context "input is valid" do
        it "returns spot of player's chosen space" do
          allow(player).to receive(:gets) { "0" }
          expect(player.choose_spot(test_board.state)).to be_nil
        end
      end

      context "input is invalid" do
        it "returns spot of player's chosen space" do
          allow(player).to receive(:gets) { "3" }
          expect(player.choose_spot(test_board.state)).to eq("3")
        end
      end
    end

    describe "#invalid_marker?" do
      context "entry is a number" do
        it "returns true" do
          expect(Player.invalid_marker?("2")).to eq(true)
        end
      end

      context "entry is less than one character in length" do
        it "returns true" do
          expect(Player.invalid_marker?("")).to eq(true)
        end
      end

      context "entry is more than one character in length" do
        it "returns true" do
          expect(Player.invalid_marker?("cat")).to eq(true)
        end
      end

      context "entry is the same as the opponent's marker" do
        it "returns true" do
          opponent_marker = "X"
          player_choice = opponent_marker
          expect(Player.invalid_marker?(player_choice, opponent_marker)).to eq(true)
        end
      end
    end

    describe "#invalid_move?" do
      context "entry does not correspond to a position on the board" do
        it "returns true" do
          expect(Player.invalid_move?("9", test_board.state)).to eq(true)
        end
      end

      context "there is already a marker at the given position on the board" do
        it "returns true" do
          expect(Player.invalid_move?("0", test_board.state)).to eq(true)
        end
      end
    end
  end
end