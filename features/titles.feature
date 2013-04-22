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

  Scenario: Subpage name in the title
    Given I am on the homepage
    When I follow the "Authors" menu-link
    Then I should see "Discover Campings by Author" in the titles
    When I follow the "Locations" menu-link
    Then I should see "Discover Campings by Location" in the titles
    When I follow the "Search" menu-link
    Then I should see "Search for Campings" in the titles

  Scenario: Camping name in the title
    Given a camping named "Beautiful Green"
    When I visit the camping page
    Then I should see "Beautiful Green - ShareShire" in the title
