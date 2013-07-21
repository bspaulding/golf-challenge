Feature: As a partipant, I want to manage the players on my bracket.

  Background:
    Given I have a bracket
    And I am editing my bracket

  Scenario: Adding a golfer
    When I have available points
    Then I should be able to add a golfer to my bracket
    When I add a golfer to my bracket
    Then I should see that the golfer has been added
    And I should see that my available points have decreased by the golfer's cost

  Scenario: Adding a golfer without points
    When I don't have available points
    Then I should not be able to add a golfer to my bracket

  Scenario: Removing a golfer
    When I remove a golfer from my bracket
    Then I should see that the golfer has been removed
    And I should see that my available points have increased by the golfer's cost

  Scenario: Search for a golfer
    When I search for golfers with 'tiger'
    Then I should see only golfer's with the letters 'tiger' in their name

