require 'spec_helper'

module TicTacToe
  describe GameController do
    let(:view) { double('view').as_null_object }
    let(:game) { ClassicGame.new }
    let(:controller) { GameController.new(view, game) }

  end
end