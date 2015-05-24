Feature: donor can pledge money to an emergency
As a donor
So that I can make contributions
I want to select an emergency and enter the amount of money to pledge.

Background:
Given I am logged in as a donor

Scenario: navigating to pledge money to an emergency
Given I am on the details page for emergency 12
When I press "Pledge"
Then I should be on the pledge page for emergency 12

Scenario: pledge money to an emergency
Given I am on the pledge page for emergency 12
When I fill in "Enter Amount (PKR)" with "123"
And I press "Submit Pledge"
Then I should see "Amount PKR 123 pledged to emergency 12" 