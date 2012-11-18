Feature: calnet login

  As an administrator
  So that I can verify the identity of the resident making requests
  I want to have students login before submitting a request

Scenario: when not logged in, user can't access site
  Given I am not logged in
  Then the home page should be inaccessible
  And I should not be logged in

Scenario: site is accessible after logging in
  Given I log in
  When I go to the home page
  Then I should be on the home page
  And I should be logged in

Scenario: logging out uses CalNet
  Given I log in
  Then logging out should redirect me to an external site
