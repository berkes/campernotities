Feature: Search

  So that I can find campings
  As a user
  I want to search and filter campings


  @javascript
  Scenario: Filter on the map
    Given 1 Campings
    And a camping named "Bij Ons" with the following labels:
       | name             | value | 
       | Dogs Allowed     | nil   | 
    When I visit the map page
    And I check "Dogs Allowed" search filter
    And I click "Refine"
    Then I should see only the camping "Bij Ons"
    And "Dogs Allowed" should be checked

  @javascript
  Scenario: Filter by values
    Given 1 Campings
    And a camping named "Bij Ons" with the following labels:
       | name             | value | 
       | Amount of places | 10-20 | 
    When I visit the map page
    And I select "10-20" from "Amount of places"
    And I click "Refine"
    Then I should see only the camping "Bij Ons"
    And in "Amount of places", "10-20" should be selected

