Feature: Homepage

  Background:
    Given there is a user with name "Anna en Bèr"
    Given the User has "1" Campings

  @javascript
  Scenario: Show campings for a user
    Given I visit the homepage
    When I click the 'Show me campings by' dropdown
    Then I should see "Anna en Bèr" in the dropdown

  Scenario: Go home via logo
    Given I visit the camping listing for "Anna en Bèr"
    When I click the logo in the top-menu
    Then I should be on the homepage

  Scenario: See top 10 campings
    Given there is a user with name "Happy Camper"
    And the User has "10" Campings
    When I visit the homepage
    Then I should see the top 10 Campings
