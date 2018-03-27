Feature: I visit NCSC guide page and want to see the event table on the guide page.

	Background: Home Screen
		Given I land on Home screen

@exampleone	
Scenario: Seeing event table when visiting NCSC site dot com
    Given  I am a user
    When I am on http://NCSC dot com/
    Then  I should see event table

@exampletwo
Scenario: Error pops if event table is not shown
	Given I am a user
	When I am on http://NSCE dot com/
	And The event table is not showing
	Then I should see "Your browser not appear to support Javascript"