Feature: Camping Images

  In order to spice up the campings
  As an administrator
  I want to upload images

  Background:
    Given I have logged in as an Administrator
    Given I create a camping with the image "green_small.jpg"

  Scenario: Create Camping with Image
    Given a 'create new camping' form
    When I attach the image "green_small.jpg"
    And I click "Create Camping"
    Then I should see the image "green_small" on the admin view page

  Scenario: Update the image of a Camping
    When I visit the update page for "Beautifull Green"
    And I attach the image "brown_small.jpg"
    And I click "Update Camping"
    Then I should see the image "brown_small.jpg" on the admin view page

  Scenario: Delete the image of a Camping
    Given I visit the update page for "Beautifull Green"
    When I delete the image
    And I visit the attributes page for "Beautifull Green"
    Then I should not see the image in attributes
