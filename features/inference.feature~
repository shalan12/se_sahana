Feature: An NGO-worker can estimate which emergencies will receive contributions from which donors
	As an NGO-worker
	So that I can make inferences about which emergencies 		types are likely to recieve contribution from what types of 		donors
	I want to view the details about all the donors that 		contributed to an emergency and all the emergencies to which a 		certain donor contributed


Scenario: View users who made a contribution to a particular emergency
Given I am logged in as an NGO-worker
And I am on the homepage
When I click on emergency "XYZ"
Then I should see "User ABC, User BCD"

Scenario: View emergencies to which a user contributed
Given I am logged in as an NGO-worker
And I am on the usersPage
When I click on "User XYZ"
Then I should see "emergency ABC, emergency BCD"
