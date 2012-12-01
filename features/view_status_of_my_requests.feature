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
  Given I am logged in as "fred"
  When I follow "check_status"
  Then I should be on the request status page
  And the page should contain these strings: "My Requests|102, Bedroom 102|Light is broken"
  And the page should not contain these strings: "101, Bedroom 101|fixit"
  When I follow "Submit"
  Then the destination should receive an email
  When I open the email
  Then I should see "[View Maintenance Request Status] Phoebe Simon from 102, Bedroom 102" in the email subject
  And the email body should contain these strings: "Name: Phoebe Simon|Phone Number: 18185192118|Email: phoebesimon@berkeley.edu|Zone: Unit 2|Building: Cunningham Hall|Area: 102, Bedroom 102|Description: Light is broken"  

