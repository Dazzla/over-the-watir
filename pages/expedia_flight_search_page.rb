class ExpediaFlightsPage
  attr_accessor :origin_search_field, :destination_search_field,
                  :outgoing_depart_date_field, :incoming_depart_date_field,
                  :no_of_adults_select, :no_of_children_select, :no_of_seniors_select, :child_age_select,
                  :preferred_airline_select,
                  :submit_button

  
  def initialize(browser, brand)
  	@browser = browser
    @brand = brand
  end
   
  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def visit
    @browser.goto(@brand)
    @browser.link(:text => "No thanks").when_present.click
  end

  def page_title
    @browser.title
  end

  def set_origin origin
    @browser.text_field(:id => "uw_flight_origin_input").set origin
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
    self.text_field(:id => "sc_Adults").set adults
  end
 
  def submit_search
    self.link(:id => "uw_flight_submit_lnk").click
  end
 
end

