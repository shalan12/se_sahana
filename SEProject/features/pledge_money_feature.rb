Background:
Given I am logged in as a donor

Scenario: navigating to pledge money to an emergency
Given I am on the informationPage
When I click on "pledge"
Then I should be on the pledgePage

Scenario: pledge money to an emergency
Given I am on the pledgePage
When I fill in amount with "123"
And I click on "pledge"
Then I should see "Amount 123 pledged to emergency" 