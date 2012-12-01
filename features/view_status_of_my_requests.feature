Feature: view status of requests

  As a resident of the dorms
  So that I can find out when my issue will be resolved
  I want to be able to view the status of my submitted requests

Background:
  Given I am on the home page
  And I have submitted the following requests:
   | name | phone | email | zone | building | area | description | work request number | date requested | user |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken | 000001 | 10/13/2012 | fred |
   | Miranda Picket | 12345678909 | berkeley@berkeley.edu | Unit 2 | Cunningham Hall | 101, Bedroom 101 | fixit | 000002 | 10/14/2012 | miranda |

Scenario: view the details of one of my requests: happy path
  Given PENDING
  Given I am logged in as "fred"
  When I follow "check_status"
  Then I should be on the request status page
  And I should see "My Requests"
  And I should see "102, Bedroom 102"
  And I should see "Light is broken"
  And I should see "10/13/2012"
  And I should not see "101, Bedroom 101"
  And I should not see "fixit"
  And I should not see "10/14/2012"
  When I follow "ask for status"
  Then the destination should receive an email
  Then I open the email
  And I should see "Phoebe Simon has requested to see the status of a request" in the email body
  And I should see "Name: Phoebe Simon" in the email body
  And I should see "Phone Number: 18185192118" in the email body
  And I should see "Email: phoebesimon@berkeley.edu" in the email body  
  And I should see "Zone: Unit 2" in the email body
  And I should see "Building: Cunningham Hall" in the email body
  And I should see "Area: 102, Bedroom 102" in the email body
  And I should see "Description: Light is broken" in the email body
  

