Feature: Titles

  So that I can determine the title
  As a user
  I want to see consistent and fancy titles

  Scenario: Name in the title
    When I visit the homepage
    Then I should see "ShareShire" in the title
    And I should see "ShareShire" as home-link

  Scenario: Camping name in the title
    Given a camping named "Beautiful Green"
    When I visit the camping page
    Then I should see "Beautiful Green - ShareShire" in the title
