class BrandConfigurator
  #Will fetch the element selectors (preferably ids) from yaml config files

  def initialize(brand)
    #Will be used to select correct element configurations
    #Will eventually use a config file - hard-coded stub for now.
    @brand = brand
  end

  def get_departure_port_element
    "uw_flight_origin_input"
  end

  def get_destination_port_element
    "uw_flight_destination_input"
  end

  def get_outgoing_depart_date_element
    "uw_flight_dep_date_input"
  end

  def get_incoming_depart_date_element
    "uw_flight_return_date_input"
  end

  def get_itinerary_type_single_element
    "uw_flight_type0"
  end

  def get_itinerary_type_return_element
      "uw_flight_type1"
  end

  def get_no_of_adults_element
    "uw_flight_adults_input"
  end

  def get_no_of_children_element
    "uw_flight_children_input"
  end

  def get_no_of_seniors_element
    "uw_flight_seniors_input"
  end

  def get_no_results_error_container_element
    "divFlightResultErrTitle"
  end

  def get_submit_button_element
    "uw_flight_submit_lnk"
  end


end