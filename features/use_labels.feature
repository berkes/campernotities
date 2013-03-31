Feature: Use labels

  So that I can find specific types of campings
  As a user
  I want to view, search and refine by labels

  Background:
  Scenario: View camping details
    Given a camping with the following labels:
       | name             | value | 
       | Dogs Allowed     | nil   | 
       | Amount of places | 1-10  | 
     When I visit the camping page
     Then I should see a table with a the following label properties:
       | label            | value |
       | Dogs Allowed     |       |
       | Amount of places | 1-10  |

  Scenario: Filter on the map
    Given 1 Campings
    And a camping named "Bij Ons" with the following labels:
       | name             | value | 
       | Dogs Allowed     | nil   | 
    When I visit the search page
    And I check "Dogs Allowed" search filter
    And I click "Refine"
    Then I should see only the camping "Bij Ons"

  Scenario: Filter by values
    Given 1 Campings
    And a camping named "Bij Ons" with the following labels:
       | name             | value | 
       | Amount of places | 10-20 | 
    When I visit the search page
    And I select "10-20" from "Amount of places"
    And I click "Refine"
    Then I should see only the camping "Bij Ons"
