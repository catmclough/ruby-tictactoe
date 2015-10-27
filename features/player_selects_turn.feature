Feature: player selects turn

As a player
    I want to select my turn
    So that I can determine the order of the rounds

    Scenario: select turn in game between player and computer
      Given I am not yet playing
      When I have selected to play a player vs. computer game
      And I have set my marker
      Then I should see "Would you like to go first or second? (Enter 1 or 2): "

    Scenario: select turn in game between two players
      Given I am not yet playing
      When I have selected to play a two-player game
      And I have set my marker
      Then I should see "Enter the marker of the player who will go first: "
