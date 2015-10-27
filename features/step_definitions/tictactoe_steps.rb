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
  @game_creator = TicTacToe::GameCreator.new(view)
end

When(/^I run the program$/) do
  @game_creator.opening_message
end

When(/^I have selected to play a player vs\. computer game$/) do
  @game_controller = @game_creator.create_new_game('1')
  @game_controller.prompt_player_marker(1)
end

When(/^I have selected to play a two\-player game$/) do
  @game_controller = @game_creator.create_new_game('2')
  @game_controller.prompt_player_marker(1)
  @game_controller.prompt_player_marker(2)
end

When(/^I have set my marker$/) do
  @game_controller.prompt_turn_selection
end

When(/^I have selected to play a two\-computer game$/) do
  @game_controller = @game_creator.create_new_game('3')
  @game_controller.set_markers
  @game_controller.set_player_turns

end

When(/^the game is played$/) do
  @game_controller.start_game
end

Given(/^the board is empty$/) do
  game_creator = TicTacToe::GameCreator.new(view)
  @game_controller = game_creator.create_new_game('1')
end

Given(/^I've set my marker as X$/) do
end

When(/^I choose "([^"]*)"$/) do |choice|
  @game_controller.instance_variable_get(:@board).place_marker(choice.to_i, "X")
end

Then(/^the board should be "([^"]*)"$/) do |state|
  board_array = @game_controller.instance_variable_get(:@board).state.map {|i| i.to_s }
  expect(board_array.join(", ")).to eq(state)
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(view.messages).to include(message)
end