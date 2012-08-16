Feature: Flight Search

  Background:
    Given  I am on http://www.expedia.co.uk/Flights

  @short_set
  Scenario: Successful search, one-way
    When I choose a flight from LHR to EDI for 2 adults, 1 child and 0 infants
    And I select a one-way flight
    And I set the departure date to be 15/10/2012
    And I click the "submit search" button
    Then I see a results page for a one-way flight search
    Then I close the browser

  @flickering
  Scenario: Successful search, return
    When I choose a flight from LHR to EDI for 2 adults, 1 child and 0 infants
    And I select a return flight
    And I set the departure date to be 20/10/2012
    And I set the return date to be 22/10/2012
    And I click the "submit search" button
    Then I see a results page for a return flight search
    Then I close the browser
    
  Scenario: Flight search returns no results
  	When I choose a flight from LBA to MAN for 1 adult, 0 children and 0 infants
  	And I select a one-way flight
  	And I set the departure date to be 22/12/2012
  	And I click the "submit search" button
  	Then I see a page title telling me that no flights have been found
    Then I close the browser
