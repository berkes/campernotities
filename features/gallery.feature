Feature: Gallery

  Background:
    Given I have logged in as an Administrator

  @javascript
  Scenario: Attach images to a new Camping 
    When I visit the 'create new camping' form
    Then I can attach new images 
