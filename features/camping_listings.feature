Feature: Camping Listings

  So that I can find campings that fit my mood and preference
  As a camping-visitor
  I want to see names and short descriptions

  Scenario: Description under 14 characters.
    Given a Camping in a list
    When I set the description to "Beautifull green."
    Then the short description should be "Beautifull green."

  Scenario: Long description, over 140 characters.
    Given a Camping in a list
    When I set the description to "Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green."
    Then the short description should be "Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beautifull green Beau"
