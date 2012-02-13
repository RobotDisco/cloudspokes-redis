Feature: Searching Kiva loans by keyword
  In order to find particular loans
  As a user
  I want to look for specific keywords

  Scenario: Clicking the search button takes me to a search results page
    Given I am on the home page
    When I fill in "keywords" with "foobar"
    And I press "Search"
    Then I should be on "the search results page"
    And I should see "Search Results"

  Scenario: I can return to the main page
    Given I am on the update page
    When I follow "Back"
    Then I should be on the home page