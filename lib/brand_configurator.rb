class BrandConfigurator
  #Will fetch the element selectors from yaml config files


  attr_reader :route, :date, :itinerary_type, :no_of_pax,
              :no_results_error_container_element, :submit_button_element

  def initialize(brand)
    #Used to select correct element configurations to give brand flexibility
    #Will eventually use a config file - hard-coded stub for now.
    #brand is specified by the customer in the features file

    @brand = brand
    @route  =             {
                            :attribute => :id,
                            :origin  => "uw_flight_origin_input",
                            :destination =>  "uw_flight_destination_input"
                          }

    @date =               {
                            :attribute => :id,
                            :outgoing_date => "uw_flight_dep_date_input",
                            :incoming_date => "uw_flight_return_date_input"
                          }

    @itinerary_type =     {
                            :attribute => :id,
                            :single =>  "uw_flight_type0",
                            :return =>  "uw_flight_type1"
                          }

    @no_of_pax =          {
                            :attribute => :id,
                            :adults =>    "uw_flight_adults_input",
                            :children =>  "uw_flight_children_input",
                            :seniors  =>  "uw_flight_seniors_input",
                            :infants =>   "" #Not required here
                          }

    @no_results_error_container_element = "divFlightResultErrTitle"
    @submit_button_element = "uw_flight_submit_lnk"
  end

end