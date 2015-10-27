require 'spec_helper'

module TicTacToe
  describe GameController do
    let(:view) { double('view').as_null_object }
    let(:constructor) { GameCreator.new(view) }
    # before { constructor.create_new_game('1') }
    # let(:game) { constructor.game }
    let(:controller) { constructor.create_new_game('1') }

    describe "set the player markers" do
      context "user has selected to play against computer" do
        before(:example) { expect(controller).to receive(:gets).and_return("x") }
        it "prompts player one to select a marker" do
          expect(view).to receive(:print).with("Player 1 - Choose your marker: ")
          controller.set_markers
        end

        it "deos not prompt player two to select a marker" do
          expect(view).not_to receive(:print).with("Player 2 - Choose your marker: ")
          controller.set_markers
        end
      end

      context "user has selected to play against another person" do
        let(:controller) { constructor.create_new_game('2') }
        before { expect(controller).to receive(:gets).and_return("x") }
        before { expect(controller).to receive(:gets).and_return("o") }
        it "prompts player one to select a marker" do
          expect(view).to receive(:print).with("Player 1 - Choose your marker: ")
          controller.set_markers
        end

        it "prompts player two to select a marker" do
          expect(view).to receive(:print).with("Player 2 - Choose your marker: ")
          controller.set_markers
        end
      end

      context "user has selected to have two computers play against eachother" do
        let(:controller) { constructor.create_new_game('3') }
        it "does not prompt either player to select a marker" do
          expect(view).not_to receive(:print).with("Player 1 - Choose your marker: ")
          controller.set_markers
        end
      end
    end

    describe "#set_player_turns" do
      context "user has selected to play against computer" do
        let(:controller) { constructor.create_new_game('1') }
        before { expect(controller).to receive(:gets).and_return("1") }
        it "asks player whether they would like to go first or second" do
          expect(view).to receive(:print).with("Would you like to go first or second? (Enter 1 or 2): ")
          controller.set_player_turns
        end
      end

      context "user has selected to play against another player" do
        let(:controller) { constructor.create_new_game('2') }
        it "asks user to enter the marker of the player who will go first" do
          expect(view).to receive(:print).with("Enter the marker of the player who will go first: ")
          controller.prompt_turn_selection
        end
      end

      context "user has selected to have two computers play against eachother" do
        let(:controller) { constructor.create_new_game('3') }
        it "does not ask the user to choose turns" do
          expect(view).not_to receive(:print)
          controller.set_player_turns
        end
      end
    end
  end
end