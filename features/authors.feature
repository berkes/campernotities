Feature: Authors

  In order to personalize the site
  As a visitor
  I want to see profiles for the authors

  Scenario: Author profile has a name
    Given there is an author "Harry"
    When I visit the profile for "Harry"
    Then I should see the title "Camping notes for Harry"
