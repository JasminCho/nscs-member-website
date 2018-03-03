Feature: As a member I want to see the calendar on the landing page.

  Background: Home Screen
    Given I land on Home screen

  @exampleone
  Scenario: Seeing the calendar landing on page.
    Given I am a user.
    When I land on the home page.
    Then I should see the calendar.

  @exampletwo
  Scenario: Warning pops if calendar is not shown.
    Given I am a user.
    When I land on the home page.
    And The calendar is not showing.
    Then I should see "Your browser not appear to support Javascript*"

  @examplethree
  Scenario: Clicking an event on calendar should redirect to another event.
    Given I am on home page.
    And I see the calendar.
    When I click on an event.
    Then I should be redirected to the event page.

