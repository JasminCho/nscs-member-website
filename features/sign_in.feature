Feature: I visit NCSC homepage

  Background: Home Screen
    Given I land on Home screen

  @exampleone
  Scenario: Users successfully sign in with google
    Given I land on Home screen
    When  I successfully sign in.
    Then I should be redirected to my homepage.

  @exampletwo
  Scenario: Users unsuccessfully sign in with google
    Given I land on Home screen
    When I failed to sign in.
    Then I should be redirected to home page with error message.