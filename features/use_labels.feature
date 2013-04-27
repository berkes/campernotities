Feature: Use labels

  So that I can find specific types of campings
  As a user
  I want to view, search and refine by labels

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
