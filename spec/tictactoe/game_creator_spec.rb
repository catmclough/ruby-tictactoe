require 'spec_helper'

module TicTacToe
  describe GameCreator do
    let(:view) { double('view').as_null_object }
    let(:output) { double('output').as_null_object }
    let(:constructor) { GameCreator.new({
                                        output: output,
                                        view: view  })
                      }
    let(:controller) { GameController.new }

    describe "#opening_message" do
      after(:each) { constructor.opening_message }
      it "attempts to clear the screen" do
        expect(constructor).to receive(:clear_screen)
      end

      it "successfully clears the screen" do
        expect(output).to receive(:print).with(view.clear_screen)
      end

      it "displays a welcome message" do
        expect(output).to receive(:puts).with(view.opening_message)
      end

      it "gives the user their game type choices" do
        expect(output).to receive(:puts).with(view.game_type_options)
      end
    end

    describe "#create_new_game" do
      context "when invalid type is chosen by player" do
        after(:each) { constructor.create_new_game('Z') }
        it "gives an error message" do
          expect(output).to receive(:puts).with(view.invalid_entry)
        end

        it "repeats the game selection instructions" do
          expect(output).to receive(:puts).with(view.game_type_options)
        end
      end

      context "when user correctly chooses a game type" do
        it "creates a classic game when user chooses game type '1'" do
          constructor.create_new_game('1')
          expect(constructor.game).to be_a(ClassicGame)
        end

        it "creates a two player game if user chooses game type '2'" do
          constructor.create_new_game('2')
          expect(constructor.game).to be_a(TwoPlayerGame)
        end

        it "creates a two computer game if user chooses game type '3'" do
          constructor.create_new_game('3')
          expect(constructor.game).to be_a(TwoComputerGame)
        end
      end
    end
  end
end