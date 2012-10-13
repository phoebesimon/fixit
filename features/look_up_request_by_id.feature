Feature: look up a previously submitted maintenance request by id

  As a resident of the dorms
  So that I can view the status of requests submitted by my suitemates or RA
  I want to be able to search for requests by their ID number
  
Background:
  Given that I have submitted the following requests:
   | name | phone number | email | zone | building | area | description | work request number | date request |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 4 | FH Building 8 | 8C42C | Light is broken | 000001 | Dec 19, 1991 |

  Given I am on the request status page

Scenario: happy path, look up a previouly submitted request
  Given I fill in "request id" with "000001"
  And I press "Search"
  Then I should be on the details page
  And I should see "Phoebe Simon"
  And I should see "18185192118"
  And I should see "phoebesimon@berkeley.edu"
  And I should see "Unit 4"
  And I should see "FH Building 8"
  And I should see "8C42C"
  And I should see "Light is broken"
  And I should see "000001"
    
Scenario: sad path, look up a request that does not exist
  Given I fill in "request id" with "000002"
  And I press "Search"
  Then I should be on the request status page
  And I should see "Request 000002 does not exist"

