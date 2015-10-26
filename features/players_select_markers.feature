Feature: user selects a marker

    As a player
    I want to select a marker
    So that I can be unique

    Scenario: select marker in game against computer
      Given I am not yet playing
      When I have selected to play a player vs. computer game
      Then I should see "Player 1 - Choose your marker: "

    Scenario: select markers in two-player game
      Given I am not yet playing
      When I have selected to play a two-player game
      Then I should see "Player 1 - Choose your marker: "
      And I should see "Player 2 - Choose your marker: "