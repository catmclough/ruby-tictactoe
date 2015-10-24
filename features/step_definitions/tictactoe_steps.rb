class View
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

  def print(message)
    messages << message
  end
end

def view
  @view ||= View.new
end

Given(/^I am not yet playing$/) do
end

When(/^I run the program$/) do
  game_controller = TicTacToe::GameController.new(view)
  game_controller.start_game
end

When(/^I have selected to play a player vs\. computer game$/) do
  game = TicTacToe::GameController.new(view)
  game.set_game_type('1')
  game.set_player_markers
end

When(/^I have selected to play a two\-player game$/) do
  game = TicTacToe::GameController.new(view)
  game.set_game_type('2')
  game.set_player_markers
end


Then(/^I should see "([^"]*)"$/) do |message|
  expect(view.messages).to include(message)
end