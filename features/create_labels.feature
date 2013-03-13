Feature: Create Labels

  So that I can make campings filterable
  As an author
  I want to set labels

  Background:
    Given I have logged in as an Administrator
    Given I have a camping "Beautifull Green"
    When I visit the update page for "Beautifull Green"

  @javascript
  Scenario: Create and set a simple label
    When I create a label "Dogs allowed"
    And I click "Update Camping"
    Then I should see the label "Dogs allowed" in attributes

  @javascript
  Scenario: Create a label with a value
    When I create a label "Amount of places" with "10-100"
    And I click "Update Camping"
    Then I should see the label "Amount of places" in attributes
    And I should see the value "10-100" with the label


