require File.expand_path(File.dirname(__FILE__) + '/flight_search_page')
require File.join(File.dirname(__FILE__), '..', 'lib', 'brand_configurator')


class BrandFlightsPage < FlightSearchPage

  attr_accessor   :departure_port, :destination_port,
                  :outgoing_depart_date, :incoming_depart_date,
                  :no_of_adults, :no_of_children, :no_of_seniors, :no_of_infants, :child_age,
                  :preferred_airline, :submit_button

  def initialize(browser, page, brand)
    @browser = browser
    configurator = BrandConfigurator.new(brand)
    @departure_port = "uw_flight_origin_input"
    @destination_port = "uw_flight_destination_input"
    @outgoing_depart_date = "uw_flight_dep_date_input"
    @incoming_depart_date =  "uw_flight_return_date_input"
    @itinerary_type_single = "uw_flight_type0"
    @itinerary_type_return = "uw_flight_type1"
    @no_of_adults =  "uw_flight_adults_input"
    @no_of_children = "uw_flight_children_input"
    @no_of_seniors = "uw_flight_seniors_input"
    @error_container = "divFlightResultErrTitle"
    @submit_button = "uw_flight_submit_lnk"
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
    self.text_field(:id => @destination_port).set destination
  end

  def set_departure_date outbound
    self.text_field(:id => @outgoing_depart_date).set outbound
  end

  def set_journey_type type
      if type == "return"
        self.radio(:id => @itinerary_type_single).set
      else
        self.radio(:id => @itinerary_type_return).set
      end
  end

  def set_return_date  inbound
     self.text_field(:id => @incoming_depart_date).set inbound
   end

  def set_number_of_adults adults
     self.select_list(:id => @no_of_adults).select adults
  end

  def set_no_of_children children
    self.select_list(:id => @no_of_children).select children
  end

  def set_no_of_seniors seniors
    self.select_list(:id => @no_of_seniors).select seniors
  end

  def no_flights_found_message
    @browser.div(:id => @error_container).text
    raise UserErrorNotDisplayed unless divFlightResultErrTitle.exists?
  end

  def submit_search
    self.link(:id => @submit_button).click
  end
end
