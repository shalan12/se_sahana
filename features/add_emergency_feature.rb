Background:
Given I am logged in as a field-worker

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

