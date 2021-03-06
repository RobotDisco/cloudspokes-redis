Feature: Updating Kiva feeds
  In order to get data from Kiva (since CloudFoundry doesn't support crons or resque just yet)
  As a user
  I want to grab the latest Kiva info by visiting a URL

  Scenario: Update url exists
    Given I am on the update page
    Then I should see "updated your Kiva info"

  Scenario: I can return to the main page
    Given I am on the update page
    When I follow "Back"
    Then I should be on the home page