
#The user story for this feature would be "As a user/member/admin, I want to use
#the navigation bar to reach every other main page in the site."

Feature: User can navigate to any main page from any page using the navigation bar
  
  As any user
  So that I can reach any main page from any page
  I want to use the navigation bar to traverse the website

Background: Start from any page
  
  Given I am logged in as a member
  Then I should see the navigation bar

Scenario: Navigate to the Home page
  
  When I click the Home button in the navigation bar
  Then I should be on the Home page

Scenario: Navigate to the About Us page
  
  When I click the About Us button in the navigation bar
  Then I should be on the About Us page

Scenario: Navigate to the Contact Us page
  
  When I click the Contact Us button in the navigation bar
  Then I should be on the Contact Us page

Scenario: Navigate to the FAQ page
  
  When I click the FAQ button in the navigation bar
  Then I should be on the FAQ page

Scenario: Navigate to the Officers page
  
  When I click the Officers button in the navigation bar
  Then I should be on the Officers page

Scenario: Navigate to the Meetings page
  
  When I click the Meetings button in the navigation bar
  Then I should be on the Meetings page

Scenario: Navigate to the Points page
 
  When I click the Points button in the navigation bar
  Then I should be on the Points page