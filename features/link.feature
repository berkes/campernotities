Feature: Link

  So that I can follow a link to the campings website
  As an admin
  I want to provide an url for a camping

  Scenario: See link for website
    Given a camping with the following parameters:
      | name | Rather Brown |
      | website | http://example.com |
    When I visit the camping page
    Then I should see a link named "Rather Brown website" to "http://example.com"

  Scenario: Set a URL in admin
    Given I have logged in as an Administrator
    And I have a camping "Rather Brown"
    When I visit the update page for "Rather Brown"
    And I fill in website with "http://example.com"
    And I click "Update Camping"
    Then the form should have no errors
