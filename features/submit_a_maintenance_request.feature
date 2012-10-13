Feature: submit a maintenance request

  As a resident of the dorms
  So that I can get things fixed
  I want to be able to a submit maintenance request

Background:
  Given I am on the home page

Scenario Outline: submit a request: happy path
  When I press "submit a maintenance request"
  Then I should be on the request page
  And I should see "Submit a Request"
  When I fill in "name" with "<name>"
  And I fill in "phone number" with "<phone number>"
  And I fill in "email" with "<email>"
  And I fill in "zone" with "<zone>"
  And I fill in "building" with "<building>"
  And I fill in "area" with "<area>"
  And I fill in "description" with "<description>"
  And I press "submit"
  Then I should be on the review page
  And I should see that my "name" is "<name>"
  And I should see that my "phone number" is "<phone number>"
  And I should see that my "email" is "<email>"
  And I should see that my "zone" is "<zone>"
  And I should see that my "building" is "<building>"
  And I should see that my "area" is "<area>"
  And I should see that my "description" is "<description>"
  When I press "confirm"
  Then I should be on the fixit home page
  And I should see "Request submitted"
  Examples:
   | name | phone number | email | zone | building | area | description |
   | Phoebe Simon | 18185192118  | phoebesimon@hotmail.com| Unit 4 | FH Building 8 | 8C42C | Light is broken |

Scenario Outline: submit a request: sad path, missing required information
  When I press "submit a maintenance request"
  Then I should be on the request page
  And I should see "Submit a Request"
  When I fill in "name" with "<name>"
  And I fill in "phone number" with "<phone number>"
  And I fill in "email" with "<email>"
  And I fill in "zone" with "<zone>"
  And I fill in "building" with "<building>"
  And I fill in "area" with "<area>"
  And I fill in "description" with "<description>"
  And I press "submit"
  Then I should see "<error>"
  Examples:
   | name | phone number | email | zone | building | area | description | error |
   | Phoebe Simon | 18185192118 | phoebesimon@hotmail.com | Unit 4 | FH Building 8 | 8C42C | Light is broken | |
   | | 18185192118  | phoebesimon@hotmail.com| Unit 4 | FH Building 8 | 8C42C | Light is broken | Enter a name |
   | Phoebe Simon |  | phoebesimon@hotmail.com | Unit 4 | FH Building 8 | 8C42C | Light is broken | Enter a phone number |
   | Phoebe Simon | 18185192118 | | Unit 4 | FH Building 8 | 8C42C | Light is broken | Enter an email address |
   | Phoebe Simon | 18185192118 | phoebesimon@hotmail.com|  | FH Building 8 | 8C42C | Light is broken | Enter a zone |
   | Phoebe Simon | 18185192118 | phoebesimon@hotmail.com| Unit 4 | | 8C42C | Light is broken | Enter a building |
   | Phoebe Simon | 18185192118 | phoebesimon@hotmail.com| Unit 4 | FH Building 8 | | Light is broken | Enter a room |
   | Phoebe Simon | 18185192118 | phoebesimon@hotmail.com| Unit 4 | FH Building 8 | 8C42C | | Enter a description |
   | | | phoebesimon@hotmail.com | Unit 4 | FH Building 8 | 8C42C | Light is broken | Enter these fields: name, phone number |
   | | | | | | | | Enter these fields: name, phone number, email, zone, building, area, description, error |

