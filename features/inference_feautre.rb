Scenario: View users who made a contribution to a particular emergency
And I am on the homepage
When I click on emergency "XYZ"
Then I should see "User ABC, User BCD"

Scenario: View emergencies to which a user contributed
And I am on the usersPage
When I click on "User XYZ"
Then I should see "emergency ABC, emergency BCD"