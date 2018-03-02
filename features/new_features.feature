Feature: As a user I want to see the calendar on the right side.

  Background: Home Screen
    Given I land on Home screen

  @exampleone
  Scenario: When I click the calendar I should be redirected to the event link.
    Given I press on Calendar
    When I press on event link
    Then I should be redirected

  @exampletwo
  Scenario: When I click the calendar 
