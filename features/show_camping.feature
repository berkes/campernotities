Feature: Show Camping

  Scenario: I can see the first image as large image
    Given A Camping
    When I visit the camping page
    Then I should see a large image
