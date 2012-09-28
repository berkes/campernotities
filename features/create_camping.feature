Feature: Create Camping

  So that the customers can browse campings
  As a writer
  I want to create a camping

  Scenario: Create camping
    Given no campings on the campings listing
    When I create a Camping named "Beautifull Green"
    Then the "Beautifull Green" camping should appear on the campings listing

