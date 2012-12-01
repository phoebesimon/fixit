Feature: look up a previously submitted maintenance request by id

  As a resident of the dorms
  So that I can view the status of requests submitted by my suitemates or RA
  I want to be able to search for requests by their ID number
  
Background:
  Given I have submitted the following requests:
   | name | phone | email | zone | building | area | description | work request number | date requested |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 2 | Martinex Commons | 138, Electrical 138 | Light is broken | 1 | Dec 19, 1991 |

  Given I am on the search page

Scenario: happy path, look up a previouly submitted request
  Given I fill in "search_request_id" with "1"
  And I press "Search"
  Then I should be on the review page for "1"
  And the page should contain these strings: "Unit 2|Martinez Commons|138, Electrical 138|Light is broken|1"
    
Scenario: sad path, look up a request that does not exist
  Given I fill in "search_request_id" with "2"
  And I press "Search"
  Then I should be on the home page
  And I should see "There is no request with the specified id: 2"

