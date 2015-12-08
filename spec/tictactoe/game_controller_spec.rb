require 'spec_helper'

module TicTacToe
  describe GameController do
    let(:view) { double('view').as_null_object }
    let(:output) { double('output').as_null_object }
    let(:constructor) { GameCreator.new({output: output, view: view}) }
    let(:controller) { constructor.create_new_game('1') }

    describe "set the player markers" do
      context "user has selected to play against computer" do
        before(:each) { expect(controller).to receive(:gets).and_return("x") }
        it "prompts player one to select a marker" do
          expect(output).to receive(:print).with(view.prompt_player_marker(1))
          controller.set_markers
        end

        it "deos not prompt player two to select a marker" do
          expect(output).to receive(:print).with(view).once
          controller.set_markers
        end
      end

      context "user has selected to play against another person" do
        let(:controller) { constructor.create_new_game('2') }
        before { expect(controller).to receive(:gets).and_return("x") }
        before { expect(controller).to receive(:gets).and_return("o") }

        it "prompts player one to select a marker" do
          expect(output).to receive(:print).with(view.prompt_player_marker(1))
          controller.set_markers
        end

        it "prompts player two to select a marker" do
          expect(output).to receive(:print).with(view.prompt_player_marker(2))
          controller.set_markers
        end
      end

      context "user has selected to have two computers play against eachother" do
        let(:controller) { constructor.create_new_game('3') }
        it "does not prompt either player to select a marker" do
          expect(output).not_to receive(:print).with(view.prompt_player_marker(1))
          controller.set_markers
        end
      end
    end

    describe "#set_player_turns" do
      context "user has selected to play against computer" do
        let(:controller) { constructor.create_new_game('1') }
        before { expect(controller).to receive(:gets).and_return("1") }
        it "asks player whether they would like to go first or second" do
          expect(output).to receive(:print).with(view.prompt_turn_selection)
          controller.set_player_turns
        end
      end

      context "user has selected to play against another player" do
        let(:controller) { constructor.create_new_game('2') }
        it "asks user to enter the marker of the player who will go first" do
          expect(output).to receive(:print).with(view.first_turn_selection)
          controller.prompt_turn_selection
        end
      end

      context "user has selected to have two computers play against eachother" do
        let(:controller) { constructor.create_new_game('3') }
        it "does not ask the user to choose turns" do
          expect(output).not_to receive(:print)
          controller.set_player_turns
        end
      end
    end
  end
end