# As a field-worker. So that I can report emergencies and their locations. I want to add emergencies tagged with my location to the database.
# As a donor. So that I can keep track of emergencies to which I contributed. I want to see details about all emergencies to which I contributed (details include area, emergency, total amount contributed yet).
# As a donor. So that I can be informed about emergencies. I want to view emergencies and affected areas.
# As a donor. So that I can make better decisions about my contributions. I want to see affected regions color coded by either number of emergencies or amount of money needed.
# As a donor. So that I can make contributions. I want to select an emergency and enter the amount of money to pledge.
# As an NGO-worker. So that I can make inferences about which emergencies types are likely to recieve contribution from what types of users. I want to view the details about all the users that contributed to an emergency.

Feature: A field worker can add an emergency 
	As a field-worker
	So that I can report emergencies and their locations
	I want to add emergencies tagged with my location to the 	 database.

Background: Given I am logged in as a field-worker

Scenario: navigating to add page
	Given I am on the homepage
	And I click on "add"
	Then I should be on addPage

Scenario: emergency should be geotagged with my location
	Given I am on the addPage
	When my location is (lat,long)
	Then I should see "(lat,long)"

Scenario: Adding a new emergency
	Given I am on the addPage
	When I fill in Amount needed with "123"
	And I fill in Emergency with "UVW"
	And I click on "add"
	Then I should see "New emergency added"

