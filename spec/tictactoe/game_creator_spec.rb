require 'spec_helper'

module TicTacToe
  describe GameCreator do
    let(:view) { double('view').as_null_object }
    # let(:game) { ClassicGame.new }
    let(:constructor) { GameCreator.new(view) }

    describe "#start_game" do
      it "displays a welcome message" do
        expect(view).to receive(:puts).with("Welcome to my Tic Tac Toe game!")
        constructor.opening_message
      end

      it "gives the user their game type choices" do
        expect(view).to receive(:puts).with("Please choose a game type:")
        constructor.opening_message
      end
    end

    describe "#create_new_game" do
      context "invalid type chosen by player" do
        it "gives an error message if input is not valid" do
          expect(view).to receive(:puts).with("Invalid game type. Please choose 1, 2, or 3:")
          constructor.create_new_game('Z')
        end
      end
    end

    describe "#prompt_player_marker" do
      context "user has selected to play against computer" do
        before { constructor.create_new_game('1') }
        it "prompts player one to select a marker" do
          expect(view).to receive(:print).with("Player 1 - Choose your marker: ")
          constructor.prompt_player_marker(1)
        end

        it "deos not prompt player two to select a marker" do
          expect(view).not_to receive(:print).with("Player 2 - Choose your marker: ")
          constructor.prompt_player_marker(2)
        end
      end

      context "user has selected to play against another person" do
        before { constructor.create_new_game('2') }
        it "prompts player one to select a marker" do
          expect(view).to receive(:print).with("Player 1 - Choose your marker: ")
          constructor.prompt_player_marker(1)
        end

        it "prompts player two to select a marker" do
          expect(view).to receive(:print).with("Player 2 - Choose your marker: ")
          constructor.prompt_player_marker(2)
        end
      end

      context "user has selected to have two computers play against eachother" do
        before { constructor.create_new_game('3') }
        it "does not prompt either player to select a marker" do
          expect(view).not_to receive(:print).with("Player 1 - Choose your marker: ")
          constructor.prompt_player_marker(1)
        end
      end

      describe "#prompt_turn_selection" do
         context "user has selected to play against computer" do
            before { constructor.create_new_game('1') }
            it "asks player whether they would like to go first or second" do
              expect(view).to receive(:print).with("Would you like to go first or second? (Enter 1 or 2): ")
              constructor.prompt_turn_selection
            end
         end

         context "user has selected to play against another player" do
            before { constructor.create_new_game('2') }
            it "asks user to enter the marker of the player who will go first" do
              expect(view).to receive(:print).with("Enter the marker of the player who will go first: ")
              constructor.prompt_turn_selection
            end
         end

         context "user has selected to have two computers play against eachother" do
            before { constructor.create_new_game('3') }
            it "does not ask the user to choose turns" do
              expect(view).not_to receive(:print)
              constructor.prompt_turn_selection
            end
         end
      end
    end
  end
end