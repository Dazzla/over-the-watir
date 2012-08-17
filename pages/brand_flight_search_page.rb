require File.expand_path(File.dirname(__FILE__) + '/flight_search_page')
require File.join(File.dirname(__FILE__), '..', 'lib', 'brand_configurator')


class BrandFlightsPage < FlightSearchPage

  attr_accessor   :departure_port, :destination_port,
                  :outgoing_depart_date, :incoming_depart_date,
                  :no_of_adults, :no_of_children, :no_of_seniors, :no_of_infants, :child_age,
                  :preferred_airline, :submit_button

  def initialize(browser, page, brand)
    super(browser, page)
    configurator  = BrandConfigurator.new(brand)
    @departure_port             = configurator.get_departure_port_element
    @destination_port           = configurator.get_destination_port_element
    @outgoing_depart_date       = configurator.get_outgoing_depart_date_element
    @incoming_depart_date       = configurator.get_incoming_depart_date_element
    @itinerary_type_single      = configurator.get_itinerary_type_single_element
    @itinerary_type_return      = configurator.get_itinerary_type_return_element
    @no_of_adults               = configurator.get_no_of_adults_element
    @no_of_children             = configurator.get_no_of_children_element
    @no_of_seniors              = configurator.get_no_of_seniors_element
    @no_results_error_container = configurator.get_no_results_error_container_element
    @submit_button              = configurator.get_submit_button_element
  end

  def visit
    @browser.goto(@start_url)
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
    @browser.div(:id => @no_results_error_container).text
    raise UserErrorNotDisplayed unless divFlightResultErrTitle.exists?
  end

  def submit_search
    self.link(:id => @submit_button).click
  end
end
