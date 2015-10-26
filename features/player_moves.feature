Feature: user chooses an empty spot on the board

    As a user
    I want to enter a number
    So that my marker will be added to the board in that spot

    Scenario Outline: empty spot is chosen
      Given the board is empty
      And I've set my marker as X
      When I choose "<spot>"
      Then the board should be "<board>"

    Scenarios:
    | spot |            board          |
    |  0   | X, 1, 2, 3, 4, 5, 6, 7, 8 |
    |  1   | 0, X, 2, 3, 4, 5, 6, 7, 8 |
    |  2   | 0, 1, X, 3, 4, 5, 6, 7, 8 |
    |  3   | 0, 1, 2, X, 4, 5, 6, 7, 8 |
    |  4   | 0, 1, 2, 3, X, 5, 6, 7, 8 |
    |  5   | 0, 1, 2, 3, 4, X, 6, 7, 8 |
    |  6   | 0, 1, 2, 3, 4, 5, X, 7, 8 |
    |  7   | 0, 1, 2, 3, 4, 5, 6, X, 8 |
    |  8   | 0, 1, 2, 3, 4, 5, 6, 7, X |