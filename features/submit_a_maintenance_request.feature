Feature: submit a maintenance request

  As a resident of the dorms
  So that I can get things fixed
  I want to be able to a submit maintenance request

Background:
  Given I am on the home page

Scenario Outline: submit a request: happy path

  When I follow "submit_request"
  Then I should be on the request page
  And I should see "Submit a Request"
  When I enter "<name>", "<phone number>", "<email>", "<zone>", "<building>", "<area>", "<description>"
  And I press "submit"
  Then the page I should be on is the review page
  And I should see that "<zone>", "<building>", "<area>", "<description>" are present
  And I should see "Request submitted"
  Then I press "home"
  Then I should be on the home page

  Examples:
   | name | phone number | email | zone | building | area | description |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken |
   | Phoebe Simon | 18185192118  | phoebesimon| Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken |

Scenario Outline: submit a request: sad path, missing required information

  When I follow "submit_request"
  Then I should be on the request page
  And I should see "Submit a Request"
  When I enter "<name>", "<phone number>", "<email>", "<zone>", "<building>", "<area>", "<description>"
  And I press "submit"
  Then I should see "<error>"

  Examples:
   | name | phone number | email | zone | building | area | description | error |
   | Phoebe Simon | 18185192118 | phoebesimon@hotmail.edu | Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | Enter a Berkeley email address |
   | | 18185192118  | phoebesimon@berkeley.edu| Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | Enter a name |
   | Phoebe Simon |  | phoebesimon@berkeley.edu | Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | Enter a phone number |
   | Phoebe Simon | 18185192118 | | Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | Enter a Berkeley email address |
   | Phoebe Simon | 18185192118 | phoebesimon@berkeley.edu| Unit 2 | Cunningham Hall | 102, Bedroom 102 | | Enter a description |

Scenario Outline: submit a request: sad path, invalid information
  When I follow "submit_request"
  Then I should be on the request page
  And I should see "Submit a Request"
  When I enter "<name>", "<phone number>", "<email>", "<zone>", "<building>", "<area>", "<description>"
  And I press "submit"
  Then I should see "<error>"
  Examples:
   | name | phone number | email | zone | building | area | description | error |
   | Phoebe Simon | 5192118 | phoebesimon@berkeley.edu | Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | Enter a phone number |
   | Phoebe Simon | 18185192118 | phoebesimon@gmail.com | Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | Enter a Berkeley email address |