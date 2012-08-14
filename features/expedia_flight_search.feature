Feature: Flight Search

  Background:
    Given I am on http://www.expedia.co.uk/Flights

  Scenario: Successful search, one-way
    When I choose a flight from LHR to EDI for 2 adults, 1 child and 0 infants
    And I select a one-way flight
    And I set the departure date to be 15/10/2012
    And I click the submit button
    Then I see a results page for a one-way flight search

  Scenario: Successful search, return
    When I choose a flight from LHR to EDI for 2 adults, 1 child and 0 infants
    And I select a return flight
    And I set the departure date to be 20/10/2012
    And I set the return date to be 22/10/2012
    And I click the submit button
    Then I see a results page for a return flight search