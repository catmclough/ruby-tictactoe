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
  game_controller = TicTacToe::GameCreator.new(view)
  game_controller.opening_message
end

When(/^I have selected to play a player vs\. computer game$/) do
  game_controller = TicTacToe::GameCreator.new(view)
  game_controller.create_new_game('1')
  game_controller.prompt_player_marker(1)
  game_controller.prompt_turn_selection
end

When(/^I have selected to play a two\-player game$/) do
  game_controller = TicTacToe::GameCreator.new(view)
  game_controller.create_new_game('2')
  game_controller.prompt_player_marker(1)
  game_controller.prompt_player_marker(2)
  game_controller.prompt_turn_selection
end


Then(/^I should see "([^"]*)"$/) do |message|
  expect(view.messages).to include(message)
end