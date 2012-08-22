require File.expand_path(File.dirname(__FILE__) + '/flight_search_page')
require File.join(File.dirname(__FILE__), '..', 'lib', 'brand_configurator')


class BrandFlightsPage < FlightSearchPage


  def initialize(browser, page, brand)
    super(browser, page)

    configurator  = BrandConfigurator.new(brand)

    #the following are hashes, provided by the configurator object. They tell the methods of this object
    #where to access the html page elements
    @route                      = configurator.route
    @date                       = configurator.date
    @itinerary_type             = configurator.itinerary_type
    @no_of_pax                  = configurator.no_of_pax

    #These are strings, also from the configurator object.
    @no_results_error_container = configurator.no_results_error_container_element
    @submit_button              = configurator.submit_button_element

  end

  def visit
    @browser.goto(@start_url)
  end

  def set_origin(origin)
    self.text_field(:id => @route[:origin]).set origin
  end

  def set_destination(destination)
    self.text_field(:id => @route[:destination]).set destination
  end

  def set_departure_date(outbound)
    self.text_field(:id => @date[:outgoing_date]).set outbound
  end

  def set_journey_type(type)
      if type == "return"
        self.radio(:id => @itinerary_type[:single]).set
      else
        self.radio(:id => @itinerary_type[:return]).set
      end
  end

  def set_return_date(inbound)
     self.text_field(:id => @date[:incoming_date]).set inbound
   end

  def set_number_of_adults(adults)
     self.select_list(:id => @no_of_pax[:adults]).select adults
  end

  def set_no_of_children(children)
    self.select_list(:id => @no_of_pax[:children]).select children
  end

  def set_no_of_seniors(seniors)
    self.select_list(:id => @no_of_adults[:seniors]).select seniors
  end

  def no_flights_found_message
    @browser.div(:id => @no_results_error_container).text
    raise UserErrorNotDisplayed, "Expected user error message not displayed" unless divFlightResultErrTitle.exists?
  end

  def submit_search
    self.link(:id => @submit_button).click
  end
end
