Feature: donor can view the emergencies in areas sorted by amount needed or number of emergencies
	As a donor
	So that I can make better decisions about my contributions
	I want to see affected regions color coded by either number of 		emergencies or amount of money needed.

Background: 
Given I am logged in as a donor

Scenario: View emergency details
Given I am on the homepage
When I click on an emergency "XYZ"
Then I should see "Emergency XYZ"

Scenario: Sort Areas by amount needed
Given I am on the homepage
When I select "amount needed"
And I click on "sort"
Then I should see "Areas coded by amount needed"


Scenario: Sort Areas by number of emergencies
Given I am on the homepage
When I select "number of emergencies"
And I click on "sort"
Then I should see "Areas coded by number of emergencies"
