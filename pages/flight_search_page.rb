class FlightSearchPage

  def initialize(browser, page, brand)
    @browser = browser
    @start_url    = page

    #Get reference to config file
    config_file = File.join(File.dirname(__FILE__), '..', 'config', 'site_config.yml')

    #Store hash of config values in local variable
    config = YAML.load_file config_file

    @brand = brand        #brand is specified by the customer in the features file

    #Define instance variables from the hash keys
    config.each do |k,v|
      instance_variable_set("@#{k}",v)
      end
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def page_title
    #Returns contents of <title> tag in current page.
    @browser.title
  end

  def visit
      @browser.goto(@start_url)
  end

  def set_origin(origin)
    self.text_field(@route[:attribute] => @route[:origin]).set origin
  end

  def set_destination(destination)
    self.text_field(@route[:attribute] => @route[:destination]).set destination
  end

  def set_departure_date(outbound)
    self.text_field(@route[:attribute]  => @date[:outgoing_date]).set outbound
  end

  def set_journey_type(type)
    if type == "return"
      self.radio(@route[:attribute]  => @itinerary_type[:single]).set
    else
      self.radio(@route[:attribute]  => @itinerary_type[:return]).set
    end
  end

  def set_return_date(inbound)
    self.text_field(@route[:attribute]  => @date[:incoming_date]).set inbound
  end

  def set_number_of_adults(adults)
     self.select_list(@route[:attribute]  => @no_of_pax[:adults]).select adults
  end

  def set_no_of_children(children)
    self.select_list(@route[:attribute]  => @no_of_pax[:children]).select children
  end

  def set_no_of_seniors(seniors)
    self.select_list(@route[:attribute]  => @no_of_adults[:seniors]).select seniors
  end

  def no_flights_found_message
    @browser.div(@no_results_error_container[:attribute] => @no_results_error_container[:error_element]).text
    raise UserErrorNotDisplayed, "Expected user error message not displayed" unless divFlightResultErrTitle.exists?
  end

  def submit_search
    self.link(@submit_button_element[:attribute] => @submit_button_element[:button_element]).click
  end

end