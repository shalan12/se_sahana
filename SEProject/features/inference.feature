Feature: An NGO-worker can estimate which emergencies will receive contributions from which donors
	As an NGO-worker
	So that I can make inferences about which emergencies types are likely to recieve contribution from what types of donors I want to view the details about all the donors that contributed to an emergency and all the emergencies to which a certain donor contributed

Background: 
Given I am logged in as a NGO-worker


Scenario: View users who made a contribution to a particular emergency
Given "Emergency1" has contributor "User1"
And I am on the Emergency1 page
When I press "See Donors"
Then I should see user with id "1"

Scenario: View emergencies to which a user contributed
Given "User1" has contributed to "Emergency1"
And I am on the donors page
When I follow the user with id "1"
Then I should see "Emergency 1"
And I should not see "Emergency 2"
