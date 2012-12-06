Feature: Manage campings

  So that a writer can manage her campings
  As a logged in writer
  I want to update and delete campings

  Scenario: Create camping
    Given I am administrator
    And no campings on the campings listing
    When I create a Camping named "Beautifull Green"
    And I visit the "Campings" administration page
    Then I should see a camping "Beautifull Green"

  Scenario: Logged in writer sees own campings dashboard
    Given I am administrator
    And I have a camping "Beautifull Green"
    When I visit the administration dashboard
    Then I should see a panel titled "My Campings"
    Then I should see camping "Beautifull Green"

  Scenario: Logged in writer can update campings
    Given I am administrator
    And I have a camping "Beautifull Green"
    When I visit the update page for "Beautifull Green"
    And I update the name to "updated!"
    And I visit the "Campings" administration page
    Then I should see a camping "updated!"

  Scenario: Logged in writer can update camping from dashboard
    Given I am administrator
    And I have a camping "Beautifull Green"
    When I visit the administration dashboard
    Then I should see the "edit"-link for "Beautifull Green"
