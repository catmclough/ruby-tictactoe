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

    describe "#start_game" do
      it "displays a welcome message" do
        expect(output).to receive(:puts).with(view.opening_message)
        constructor.opening_message
      end

      it "gives the user their game type choices" do
        expect(output).to receive(:puts).with(view.game_type_options)
        constructor.opening_message
      end
    end

    describe "#create_new_game" do
      context "invalid type chosen by player" do
        it "gives an error message if input is not valid" do
          expect(output).to receive(:puts).with(view.invalid_entry)
          constructor.create_new_game('Z')
        end
      end
    end
  end
end