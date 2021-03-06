Feature: Gallery Administration

  Background:
    Given I have logged in as an Administrator

  @javascript
  Scenario: Attach images to a new Camping 
    When I visit the 'create new camping' form
    Then I can attach new images 

  Scenario: Attached images show up on the attributes page
    Given I have a camping with the image "green_small.jpg"
    When I visit the show page for "Beautifull Green"
    Then I should see the image "green_small.jpg" on the attributes page

  Scenario: Attached images show as thumbnail on the "hint"
    Given I have a camping with the image "green_small.jpg"
    When I visit the update page for "Beautifull Green"
    Then I should see the image "green_small.jpg" in a hint

  Scenario: Delete an image from a Camping
    Given I have a camping with the image "green_small.jpg"
    When I visit the update page for "Beautifull Green"
    And I mark the image for removal
    And I click "Update Camping"
    Then I should see the default image on the attributes page

  Scenario: Update an image in a Camping
    Given I have a camping with the image "green_small.jpg"
    When I visit the update page for "Beautifull Green"
    And I update the image to "brown_small.jpg"
    And I click "Update Camping"
    Then I should see the image "brown_small.jpg" on the attributes page
