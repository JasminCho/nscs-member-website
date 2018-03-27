Feature: I visit NCSC login page
  In order to go to the homepage
  As a member
  I want to click on the login button

  @exampleone
  Scenario: Users successfully sign in with google
    Given I am on the login page
    When I click on the login button
    And I successfully sign in.
    Then I should be redirected to my homepage.

  @exampletwo
  Scenario: Users unsuccessfully sign in with google
    Given I am on the login page
    When I click on the login button
    And I failed to sign in
    Then I should be redirected to the same page with error message