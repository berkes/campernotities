Feature: Markdown

  So that I can format my description
  As an admin
  I want to use Markdown

  Scenario: Display a Camping with formatting
    Given I have a Camping with a description with no markup
    When I visit the camping page
    Then I should see no markup

  Scenario: Display a Camping with simple formatting
    Given I have a Camping with a description with simple markup
    When I visit the camping page
    Then I should see breaks and paragraphs

  Scenario: Display a Camping with complex formatting
    Given I have a Camping with a description with complex markup
    When I visit the camping page
    Then I should see complex HTML
