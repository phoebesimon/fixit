Feature: real time request status update by work order number

  As a User
  So that I can get an instant snapshot of the request status
  I want to be able to search by the RSSP provided work order number

Background:
  Given I am on the home page
  And I am logged in as "fred"
  When I follow "check_status"
  Then I should be on the request status page

Scenario: happy path, look up a work order that has completed
  Given I have replaced the path "HM-218000"
  And I fill in "request_id_request_id" with "HM-218000"
  And I press "Search"
  Then I should be on the work order view page
  And the page should contain these strings: "Channing Bowditch|CB-338C|My chair has been a broken one before I moved in, it does not workvery well. Whenever I sit on it and adjust the height, it will change toits original height when I get up.|11/16/2012 16:08 Zong Li - replace chair|Requested action has been completed|11/07/2012|11/19/2012"
  
Scenario: happy path, look up a work order that has not been completed
  Given I have replaced the path "HM-219000"
  And I fill in "request_id_request_id" with "HM-219000"
  And I press "Search"
  Then I should be on the work order view page
  And the page should contain these strings: "Pat Brown's Grille|PB-Bldg|PM Weekly Inspection On Kitchen Equipment|Working on it|11/19/2012"

Scenario: sad path, look up a non-existent work order
  Given I have replaced the path "yay"
  And I fill in "request_id_request_id" with "yay"
  And I press "Search"
  Then I should be on the request status page
  And I should see "There is no work order with the id: yay. Are you sure you formatted the ID correctly? (e.g. HM-654321)"