@javascript
Feature: Adaptive dropdown menus feature

  As a user
  So that I can more easily select my location for a maintenance request
  I want the drop down menus to limit my choices depending what I have selected already

Background:
  Given I am on the request page

Scenario: filter buildings: happy path
  Given PENDING filter buildings: happy path
  When I select "Unit 2" from "request_zone"
  Then all of the "buildings" in "Unit 2" should be in the "request_building" menu
  And all of the "buildings" in "Unit 1" should not be in the "request_building" menu

Scenario: filter buildings: sad path (don't actually filter buildings)
  Given PENDING filter buildings: sad path (don't actually filter buildings)
  Then all of the "buildings" in "Unit 2" should be in the "request_building" menu
  And all of the "buildings" in "Unit 1" should be in the "request_building" menu

Scenario: filter locations: happy path
  Given PENDING filter locations: happy path
  When I select "Unit 2" from "request_zone"
  And I select "Cunningham Hall" from "request_building"
  Then all of the "areas" in "Cunningham Hall" should be in the "request_area" menu
  And all of the "areas" in "Martinez Commons" should not be in the "request_area" menu
Scenario: filter location: sad path (don't actually filter buildings)
  Given PENDING filter location: sad path (don't actually filter buildings)
  Then all of the "areas" in "Cunningham Hall" should be in the "request_area" menu
  And all of the "areas" in "Martinez Commons" should be in the "request_area" menu

Scenario: reverse filtering zone: happy path
  Given PENDING reverse filtering zone: happy path
  When I select "Cunningham Hall" from "request_building"
  Then "Unit 2" should be selected from "request_zone"
  And "Unit 1" should not be selected from "request_zone"
  Then all of the "areas" in "Cunningham Hall" should be in the "request_area" menu
  And all of the "areas" in "Martinez Commons" should not be in the "request_area" menu

Scenario: grey out area if zone and building not selected first
 Given PENDING grey out area if zone and building not selected first
 Then the "request_area" should say "Choose a building and zone first"
 Then I select "Unit 2" from "request_zone"
 And I select "Cunningham Hall" from "request_building"
 Then all of the "areas" in "Cunningham Hall" should be in the "request_area" menu
