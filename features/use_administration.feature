Feature: Use administration area

  So that I can administrate the application
  As an administrator
  I can visit the adminstration area

  Scenario: Get a login form
    Given I am not logged in
    When I vist the administration dashboard
    Then I should see a login-form

  Scenario: Access the Dashboard
    Given I am not logged in
    And there is a user "admin@example.com" with password "password"
    When I log in with username "admin@example.com" and password "password"
    Then I should see a dashboard
