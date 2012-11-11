@javascript
Feature: Adaptive dropdown menus feature

  As a user
  So that I can more easily select my location for a maintenance request
  I want the drop down menus to limit my choices depending what I have selected already

Background:
  Given I am on the request page

Scenario: filter buildings: happy path
  When I select "Unit 2" from "request_zone"
  And I wait until all Ajax requests are complete
  Then all of the "buildings" in "Unit 2" should be in the "request_building" menu
  And all of the "buildings" in "Unit 1" should not be in the "request_building" menu

Scenario: filter buildings: happy path
  When I select "Unit 1" from "request_zone"
  And I wait until all Ajax requests are complete
  Then all of the "buildings" in "Unit 1" should be in the "request_building" menu
  And all of the "buildings" in "Unit 2" should not be in the "request_building" menu

Scenario: filter buildings: sad path (don't actually filter buildings)
  Then all of the "buildings" in "Unit 2" should be in the "request_building" menu
  And all of the "buildings" in "Unit 1" should be in the "request_building" menu

Scenario: filter locations: happy path
  When I select "Unit 2" from "request_zone"
  And I select "Cunningham Hall" from "request_building"
  Then all of the "areas" in "Cunningham Hall" should be in the "request_area" menu
  And all of the "areas" in "Martinez Commons" should not be in the "request_area" menu

Scenario: reverse filtering of locations
  Given PENDING reverse filtering of locations
  When I select "Cunningham Hall" from "request_building"
  And I wait until all Ajax requests are complete
  Then "Unit 2" should be selected from "request_zone"

Scenario: resetting dropdown menus
  Given PENDING resetting dropdown menus
  When I select "Unit 2" from "request_zone"
  And I wait until all Ajax requests are complete 
  And I select "Cunningham Hall" from "request_building"
  And I wait until all Ajax requests are complete 
  And I select "Choose a Building" from "request_building"
  And I wait until all Ajax requests are complete       
  Then all of the "areas" in "Cunningham Hall" should not be in the "request_area" menu