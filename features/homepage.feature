Feature: Homepage

  Background:
    Given there is a user with name "Anna en Bèr"
    Given the User has "10" Campings

  Scenario: Show campings for a user
    Given I visit the homepage
    When I click the 'Show me campings by' dropdown
    And I select "Anna en Bèr" from the dropdown
    Then I should see the title "Camping notes for Anna en Bèr"
