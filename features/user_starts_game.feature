Feature: user starts game

    As a user
    I want to start a game
    So that I can select a game type

    Scenario: start game
      Given I am not yet playing
      When I run the program
      Then I should see "Welcome to my Tic Tac Toe game!"
      And I should see "Please choose a game type:"
      And I should see "1. You vs. Computer"
      And I should see "2. 2-Player"
      And I should see "3. Computer vs. Computer"