Feature: Viewing the home page
    In order to test this Sinatra application
    As a user
    I want to view the home page

    Scenario: View home page, see text elements
        Given I am on the home page
        Then I should see "Update from Kiva feed"
        And I should see "Get 10 random loans"
