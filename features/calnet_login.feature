Feature: calnet login

  As an administrator
  So that I can verify the identity of the resident making requests
  I want to have students login before submitting a request

Scenario: log in when you are not logged in
  Given PENDING log in when you are not logged in
  Given I am not logged in
  When I go to the home page
  Then I should not be logged in
  And I should be on the calnet login page
  And I log in
  Then I should be on the home page
  And I should be logged in
Scenario: go straight to home page when you are logged in
 Given PENDING go straight to home page when you are logged in
 Given I am logged in
 When I go to the home page
 Then I should be on the home page
 And I should be logged in