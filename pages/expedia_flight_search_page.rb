require File.expand_path(File.dirname(__FILE__) + '/flight_search_page')

class ExpediaFlightsPage < FlightSearchPage

  attr_accessor   :departure_port, :destination_port,
                  :outgoing_depart_date, :incoming_depart_date,
                  :no_of_adults, :no_of_children, :no_of_seniors, :no_of_infants, :child_age,
                  :preferred_airline, :submit_button

  def initialize(browser, page)
    @browser = browser
    @departure_port =  "uw_flight_origin_input"
    @start_url = page
  end

  def visit
    @browser.goto(@start_url)
    @browser.link(:text => "No thanks").when_present.click
  end

  def set_origin origin
    self.text_field(:id => @departure_port).set origin
  end

  def set_destination destination
    self.text_field(:id => "uw_flight_destination_input").set destination
  end

  def set_departure_date outbound
    self.text_field(:id => "uw_flight_dep_date_input").set outbound
  end

  def set_journey_type type
    if type == "return"
      self.radio(:id => "uw_flight_type0").set
    else
      self.radio(:id => "uw_flight_type1").set
    end
  end
  
  def set_return_date  inbound
    self.text_field(:id => "uw_flight_dep_date_input").set inbound
  end

  def set_number_of_adults adults
    self.select_list(:id => "uw_flight_adults_input").select adults
  end
 
  def no_flights_found_message
    @browser.div(:id => "divFlightResultErrTitle").text
    raise UserErrorNotDisplayed unless divFlightResultErrTitle.exists? 
  end

  def submit_search
    self.link(:id => "uw_flight_submit_lnk").click
  end
end

