Feature: Gallery

  @javascript
  Scenario: Attach images to a Camping
    Given I have logged in as an Administrator
    And I have a camping "Beautifull Green"
    When I visit the update page for "Beautifull Green"
    Then I can attach new images 
