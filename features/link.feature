Feature: Link

  So that I can follow a link to the campings website
  As an admin
  I want to provide an url for a camping

  Scenario: Provide a simple url for website
    Given a camping with the following parameters:
      | name | Rather Brown |
      | website | http://example.com |
    When I visit the camping page
    Then I should see a link named "Rather Brown website" to "http://example.com"
