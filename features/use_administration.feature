Feature: Use administration area

  So that I can administrate the application
  As an administrator
  I can visit the adminstration area

  Scenario: Get a login form when I am not logged in but access administration area
    Given I am not logged in
    When I visit the administration dashboard
    Then I should see a login-form

  Scenario: Access the Dashboard
    Given I am not logged in
    And there is a user "admin@example.com" with password "password"
    When I log in with username "admin@example.com" and password "password"
    Then I should see a dashboard

  Scenario: Find login on hompage
    Given I am not logged in
    When I visit the homepage
    And I follow the "Login" menu-link
    Then I should see a login-form

  Scenario: Find administration-link on homepage
    Given I have logged in as an Administrator
    When I visit the homepage
    And I follow the "Administration" menu-link
    Then I should see a dashboard

  Scenario: My name shows me that I am logged in 
    Given I have logged in as an Administrator
    When I visit the homepage
    Then I should see my name in the menu
