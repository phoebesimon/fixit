Feature: sending email upon creation of a request

As an administrator
So that I can properly respond to maintenance requests
I want to receive emails upon the creation of requests

Background:
  Given I am on the home page

Scenario Outline: An email is generated and sent upon request creation
  When I follow "submit_request"
  Then I should be on the request page
  And I should see "Submit a Request"
  When I enter "<name>", "<phone number>", "<email>", "<zone>", "<building>", "<area>", "<description>"
  And I press "submit"
  Then the page I should be on is the review page
  And I should see "Request submitted" 
  Then the destination should receive an email
  When I open the email
  Then the email body should contain these strings: "Name: <name>|Phone Number: <phone number>|Email: <email>|Zone: <zone>|Building: <building>|Area: <area>|Description: <description>"

Examples:
   | name | phone number | email | zone | building | area | description |
   | Phoebe Simon | 18185192118  | phoebesimon@berkeley.edu| Unit 2 | Cunningham Hall | 102, Bedroom 102 | Light is broken |
