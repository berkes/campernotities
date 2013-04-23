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

  Scenario: Show the latitude and longitude as a pin on a map
    Given a camping with latitude latitude "51.77802459999999" and longitude "5.9757149" exists
    When I visit the camping page
    Then I should see a Google Map
    And I should see the maps location at "51.77802459999999", "5.9757149"

  Scenario: Show the latitude and longitude in a properties-table
    Given a camping with latitude latitude "51.77802459999999" and longitude "5.9757149" exists
    When I visit the camping page
    Then I should see a table with a geo property

  Scenario: A camping without latitude and longitude
    Given A Camping without a geocode
    When I visit the camping page
    Then I should not see a Google Map
    And I should not see a table with a geo property

  Scenario: Follow the map menu-link
    Given 15 geocoded Campings
    And I am on the homepage
    When I follow the "Locations" menu-link
    Then I should see an interactive Google Map
    And I should see all the campings on the map

  @javascript
  Scenario: Follow link with latitude and longitude parameters
    Given 15 geocoded Campings
    When I visit the map page with latitude=20 and longitude=20
    Then it should center the map on latitude "20" and longitude "20"

  @javascript
  Scenario: Allow application to access my location
    Given 15 geocoded Campings
    And I am on the homepage
    When I follow the "Locations" menu-link
    Then it should ask me if I allow to share my current location
    And it should center the map on my current location
