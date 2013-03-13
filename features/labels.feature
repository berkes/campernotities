Feature: Labels

  So that I can make campings filterable
  As an author
  I want to set labels

  Background:
    Given I have logged in as an Administrator

  @javascript
  Scenario: Create and set a simple label
    Given I have a camping "Beautifull Green"
    When I visit the update page for "Beautifull Green"
    And I create a label "Dogs allowed"
    And I click "Update Camping"
    Then I should see the label "Dogs allowed" in attributes on the attributes page
