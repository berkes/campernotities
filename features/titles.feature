Feature: Titles

  So that I can determine the title
  As a user
  I want to see consistent and fancy titles

  Scenario: Name in the title
    When I visit the homepage
    Then I should see "ShareShire" in the title
    And I should see "ShareShire" as home-link

  Scenario: Tagline in title
    When I visit the homepage
    Then I should see "Share and Discover those Special Campings" in the title

  Scenario: Camping name in the title
    Given a camping named "Beautiful Green"
    When I visit the camping page
    Then I should see "Beautiful Green - ShareShire" in the title

  Scenario Outline:
    Given I am on the homepage
    When I follow the "<link>" menu-link
    Then I should see "<title>" in the titles

    Examples:
       | link      | title                         |
       | Authors   | Discover Campings by Author   |
       | Locations | Discover Campings by Location |
       | Search    | Search for Campings           |

  Scenario: Author page title
    Given there is a user with name "Bèr"
    When I visit the camping listing for "Bèr"
    Then I should see "Discover Campings by Bèr" in the titles

