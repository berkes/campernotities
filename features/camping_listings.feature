Feature: Camping Listings

  So that I can find campings that fit my mood and preference
  As a camping-visitor
  I want to see names and short descriptions

  Scenario: Campings appear on listing
    Given there is a camping with name "Beautifull Green"
    When I visit the camping listing
    Then I should see a camping "Beautifull Green"

  Scenario: Description under 14 characters.
    Given there is a camping with name "Beautifull Green"
    When I set the description to "Beautifull green."
    And I visit the camping listing
    Then the short description should be "Beautifull green."

  Scenario: Long description, over 140 characters.
    Given there is a camping with name "Beautifull Green"
    When I set the description to "Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green."
    And I visit the camping listing
    Then the short description should be "Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beau"

  Scenario: Follow link to camping page
    Given there is a camping with name "Beautifull Green"
    When I visit the camping listing
    And I follow the "read more" link
    Then I should see a camping "Beautifull Green"
