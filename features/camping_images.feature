Feature: Camping Images

  In order to spice up the campings
  As an administrator
  I want to upload images

  Background:
    Given I have logged in as an Administrator

  @wip
  Scenario: Create Camping with Image
    Given a 'create new camping' form
    When I attach an image
    And I click update
    Then I should see the image on the view admin camping page

