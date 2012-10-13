Feature: submit a maintenance request

  As a resident of the dorms
  So that I can get things fixed
  I want to be able to a submit maintenance request

Background:
  Given I am on the home page

Scenario Outline: submit a request: happy path
  When I press the "submit a maintenance request" button
  Then I should be on the request page
  And I should see "Submit a Request"
  And I enter "<name>" into the "name" field
  And I enter "<phone number>" into the "phone number" field
  And I enter "<email>" into the "email" field
  And I enter "<zone>" into the "zone" field
  And I enter "<building>" into the "building" field
  And I enter "<area>" into the "area" field
  And I enter "<description>" into the "description" field
  And I press the "submit" button
  Then I should be on the review page
  And I should see that my "name" is "<name>"
  And I should see that my "phone number" is "<phone number>"
  And I should see that my "email" is "<email>"
  And I should see that my "zone" is "<zone>"
  And I should see that my "building" is "<building>"
  And I should see that my area is "<area>"
  And I should see that my description is "<description>"
  And I press the "confirm" button
  Then I should be on the fixit home page
  And I should see "Request submitted"
  Examples:
   | name | phone number | email | zone | building | area | description |
   | Phoebe Simon | 18185192118  | phoebesimon@hotmail.com| Unit 4 | FH Building 8 | 8C42C | Light is broken |

Scenario Outline: submit a request: sad path, missing required information
  When I press the "submit a maintenance request" button
  Then I should be on the request page
  And I should see "Submit a Request"
  And I enter "<name>" into the "name" field
  And I enter "<phone number>" into the "phone number" field
  And I enter "<email>" into the "email" field
  And I enter "<zone>" into the "zone" field
  And I enter "<building>" into the "building" field
  And I enter "<area>" into the "area" field
  And I enter "<description>" into the "description" field
  And I press the "submit" button
  Then the errror "<error>" should appear
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

