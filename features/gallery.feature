Feature: Gallery

  Background:
    Given I have logged in as an Administrator

  @javascript
  Scenario: Attach images to a new Camping 
    When I visit the 'create new camping' form
    Then I can attach new images 

  Scenario: Attached images show un the attributes page
    Given I have a camping with the image "green_small.jpg"
    When I visit the show page for "Beautifull Green"
    Then I should see the image "green_small.jpg" on the attributes page
