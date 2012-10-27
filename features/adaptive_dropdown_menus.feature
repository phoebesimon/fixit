Feature: Adaptive dropdown menus feature

  As a user
  So that I can more easily select my location for a maintenance request
  I want the drop down menus to limit my choices depending what I have selected already

Background:
  Given I am on the request page
 
Scenario: filter buildings: happy path

  When I select "Unit 2" from "request_zone"
  Then all of the "Unit 2" buildings should be in the drop down menu
  And all of the "Unit 1" buildings should not be in the drop down menu

Scenario: filter buildings: sad path (don't actually filter buildings)
  All of the "Unit 2" building should be in the drop down menu
  And all of the "Unit 1" buildings should be in the drop down menu

Scenario: filter locations: happy path
 
  When I select "Unit 2" from "request_zone"
  And I select "Cunningham Hall" from "request_building"
  Then all of the "Cunningham Hall" areas should be in the drop down menu
  And all of the "Martinez Commons" areas should not be in the drop down menu

Scenario: filter location: sad path (don't actually filter buildings)

  All of the "Cunningham Hall" areas should be in the drop down menu
  And all of the "Martinez Commons" areas should be in the drop down menu

Scenario: reverse filtering zone: happy path

  When I select "Cunningham Hall" from "request_building"
  Then "Unit 2" should be selected from "request_zone"
  And "Unit 1" should not be selected from "request_zone"
  Then all of the "Cunningham Hall" areas should be in the drop down menu
  And all of the "Martinez Commons" areas should not be in the drop down menu

Scenario: grey out area if zone and building not selected first
 The "request_area" should say "Choose a building and zone first"
 Then I select "Unit 2" from "request_zone"
 And I select "Cunningham Hall" from "request_building"
 Then "request_area" should not say "Choose a building and zone first"