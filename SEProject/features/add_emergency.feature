Feature: A field worker can add an emergency 
	As a field-worker
	So that I can report emergencies and their locations
	I want to add emergencies tagged with my location to the database.

Background: 
	Given I am logged in as a field-worker

Scenario: navigating to add page
	Given I am on the home page
	And I follow "Add Emergency"
	Then I should be on the new_emergency page

Scenario: emergency should be geotagged with my location
	Given My location is "1.2.3.4"
	When I am on the new_emergency page
	Then the "Latitude" field should contain "47.945"
	And the "Longitude" field should contain "-122.305"

Scenario: Adding a new emergency
	Given I am on the new_emergency page
	When I fill in "Amount Needed (PKR)" with "123"
	And I fill in "Type" with "UVW"
	And I press "Add Emergency"
	Then I should see "New Emergency added"