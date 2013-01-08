Feature: Camping Listings

  So that I can find campings that fit my mood and preference
  As a camping-visitor
  I want to see names and short descriptions

  Background:
    Given there is a user with name "Anna en Bèr"

  Scenario: Campings appear on listing
    Given User has a camping with name "Beautifull Green"
    When I visit the camping listing for "Anna en Bèr"
    Then I should see a camping "Beautifull Green"

  Scenario: Description under 14 characters.
    Given User has a camping with a description "Beautifull green."
    When I visit the camping listing for "Anna en Bèr"
    Then I should see the description "Beautifull green."

  Scenario: Long description, over 140 characters.
    Given User has a camping with a description "Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green."
    When I visit the camping listing for "Anna en Bèr"
    Then I should see the description "Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beau"

  Scenario: Follow link to camping page
    Given User has a camping with a description "Beautifull Green Site"
    When I visit the camping listing for "Anna en Bèr"
    And I follow the "read more" link
    Then I should see a camping "Beautifull Green"
    And I should see the description "Beautifull Green Site"

  Scenario: View campings for User
    Given User has a camping with name "Beautifull Green"
    And Another user has a camping with name "Rather Brown"
    When I visit the camping listing for "Anna en Bèr"
    Then I should see only the camping "Beautifull Green"
