require "rubygems"
require "watir-webdriver"

b = Watir::Browser.new
b.goto("http://www.expedia.co.uk/http://www.expedia.co.uk/Flights")
b.radio(:id => "flight-only").when_present.select
b.select_list(:id => "flightSearchWizard_inpNumAdults").select "2"
b.text_field(:id => "uw_flight_origin_input").set "LHR"
b.text_field(:id => "uw_flight_destination_input").set "EDI"
b.text_field(:id => "uw_flight_dep_date_input").set "09/10/2012"
b.text_field(:id => "uw_flight_return_date_input").set "16/10/2012"

