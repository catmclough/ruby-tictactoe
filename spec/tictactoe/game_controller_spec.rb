require 'spec_helper'

module TicTacToe
  describe GameController do
    let(:view) { double('view').as_null_object }
    let(:game) { GameController.new(view) }

    describe "#start_game" do
      it "displays a welcome message" do
        expect(view).to receive(:puts).with("Welcome to my Tic Tac Toe game!")
        game.start_game
      end

      it "gives the user their game type choices" do
        expect(view).to receive(:puts).with("Please choose a game type:")
        game.start_game
      end
    end

    describe "#create_new_game" do
      context "invalid type chosen by player" do
        it "gives an error message if input is not valid" do
          expect(view).to receive(:puts).with("Invalid game type. Please choose 1, 2, or 3:")
          game.create_new_game('Z')
        end
      end
    end
  end
end