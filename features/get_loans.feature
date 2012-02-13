Feature: Retrieving Kiva loans
  In order to get Kiva loan information
  As a user
  I want to retrieve a JSON feed from the site

  Scenario: Get random loan info
    Given I am on the random loans page
    Then the JSON should have "loans"
    And the JSON at "loans" should be an array
    And the JSON at "loans" should have 10 entries