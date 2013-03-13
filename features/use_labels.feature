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
     Then I should see a table with a the following label properties:
       | label            | value |
       | Dogs Allowed     |       |
       | Amount of places | 1-10  |

  @wip
  Scenario: Filter on the map
    Given 12 Campings
    And a camping named "Bij Ons" with the following labels:
       | name             | value | 
       | Dogs Allowed     | nil   | 
    When I visit the search page
    And I check "Dogs Allowed"
    And I click "Refine"
    Then I should see only the camping "Bij Ons"
