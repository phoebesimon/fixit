Feature: view status of requests

  As a resident of the dorms
  So that I can find out when my issue will be resolved
  I want to be able to view the status of my submitted requests

Background:
  Given I am on the home page
  And I have submitted the following requests:
   | name | phone number | email | zone | building | area | description | work request number | date requested |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 4 | FH Building 8 | 8C42C | Light is broken | 000001 | 10/13/2012 |

Scenario Outline: view the details of one of my requests: happy path
  When I press "Check Status"
  Then I should be on the request status page
  And I should see "My Requests"
  And I should see "<area>"
  And I should see "<description>"
  And I should see "<work request number>"
  And I should see "<date requested>"
  And I follow "more about <work request number>"
  Then I should be on the details page
  And I should see that my "name" is "<name>"
  And I should see that my "phone number" is "<phone number>"
  And I should see that my "email" is "<email>"
  And I should see that my "zone" is "<zone>"
  And I should see that my "building" is "<building>"
  And I should see that my "area" is "<area>"
  And I should see that my "description" is "<description>"
  And I should see that my "work order number" is "<work order number>"
  And I should see that my "date requested" is "<date requested>"
  Examples:  
   | name | phone number | email | zone | building | area | description | work request number | date requested |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 4 | FH Building 8 | 8C42C | Light is broken | 000001 | 10/13/2012 |

