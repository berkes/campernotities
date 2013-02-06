Feature: Show Camping

  Scenario: I can see the images
    Given A Camping
    When I visit the camping page
    Then I should see all images as large image
