#The user story we had was:
# As an officer, on the admin page, I would like also an option that lets me modify/update
#events and its properties in the webpage calendar.
#Story Board:
#◦ After login, option to manage calendar appears. User gets redirected to modify
#calendar options.
#◦ User gets visual calendar and chooses date to modify calendar.
#◦ User gets current events plus option for adding new event to date.
#◦ User gets menu for modifying event if clicks on previously defined event. Otherwise
#new event menu appears.
#◦ User finishes with changes and gets back to the calendar for further changes.

Feature: An admin can edit the calender events 
  
  As an admin
  I want to be able to edit the calender events

Background: Start from the admin page
  
  Given I am logged in as an admin
  Then I should see the "modify" button

Scenario: Redirection to modify calender occurs and calender loads
  
  When I click the "modify" button
  Then the modify options page appears
  And the calender loads
  
Scenario: User can select each date on the calender to edit or delete events
  
  When I click a day on the calender
  Then the events in that day appear
  And I can see the "add event" button
  When I click an event that is already defined
  Then I can edit that event
 
Scenario: User creates a new event
  
  When I click the "add event" button
  Then a new event menu appears
  And I can enter the name of the event
  When I click the "done" button
  Then the calender page appears again