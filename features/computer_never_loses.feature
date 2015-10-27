Feature: computer never loses a game

    As a user
    I that the difficulty level to be very hard
    So that the computer never loses a game

    Scenario: computer always ties in game against another computer
      Given I am not yet playing
      When I have selected to play a two-computer game
      And the game is played
      Then I should see "CATS GAME."