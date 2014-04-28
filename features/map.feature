Feature: Place campings on a Map

  So that I can find campings on a map
  As an author
  I want to place a camping on a map

  Scenario: Store a latitude and longitude with a camping
    Given I have logged in as an Administrator
    And I have a camping "Bij Ons"
    When I visit the update page for "Bij Ons"
    And I fill in the form with latitude "51.77802459999999" and longitude "5.9757149"
    And I click "Update Camping"
    Then the form should have no errors
    And the camping should have a latitude and longitude

  @wip
  Scenario: Show the latitude and longitude as a pin on a map
    Given a camping with latitude latitude "51.77802459999999" and longitude "5.9757149" exists
    When I visit the camping page
    Then I should see a Google Map
    And I should see the maps location at "51.77802459999999", "5.9757149"
    And it should link to the search page, centered at "51.77802459999999", "5.9757149"

  Scenario: Show the latitude and longitude in a properties-table
    Given a camping with latitude latitude "51.77802459999999" and longitude "5.9757149" exists
    When I visit the camping page
    Then I should see a table with a geo property

  Scenario: A camping without latitude and longitude
    Given A Camping without a geocode
    When I visit the camping page
    Then I should not see a Google Map
    And I should not see a table with a geo property

  @javascript
  Scenario: Follow the map menu-link
    Given 2 geocoded Campings
    When I visit the map page
    Then I should see an interactive Google Map
    And I should see all 2 campings
