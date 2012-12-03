Feature: Manage campings

  So that a writer can mamage her campings
  As a logged in writer
  I want to update and delete campings

  Scenario: Logged in writer sees own campings dashboard
    Given I am administrator
    And I have a camping "Beautifull Green"
    When I vist the administration dashboard
    Then I should see a panel titled "My Campings"
    Then I should see camping "Beautifull Green"

  @wip
  Scenario: Logged in writer updates a camping
    Given I am administrator
    And a writer has a camping
    When the writer clicks update
    And updates the camping title to "updated!"
    Then the "updated!" camping should appear on the campings listing

