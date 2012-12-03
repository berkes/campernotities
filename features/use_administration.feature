Feature: Use administration area

  So that I can administrate the application
  As an administrator
  I can visit the adminstration area

  @wip
  Scenario: Log into admin dashboard
    Given I am not logged in
    When I vist the administration dashboard
    Then I should see a login-form

