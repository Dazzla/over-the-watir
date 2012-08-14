require "rubygems"
require "watir-webdriver"

@browser = Watir::Browser.new
@browser.goto("http://www.expedia.co.uk/Flights")
@browser.link(:text => "No thanks").when_present.click
@browser.text_field(:id => "uw_flight_origin_input").set "LHR"
@browser.text_field(:id => "uw_flight_destination_input").set "EDI"
@browser.text_field(:id => "uw_flight_dep_date_input").set "09/10/2012"
@browser.text_field(:id => "uw_flight_return_date_input").set "16/10/2012"
@browser.select_list(:id => "uw_flight_adults_input").select "2"
@browser.select_list(:id => "uw_flight_children_input").select "0"
@browser.select_list(:id => "uw_flight_seniors_input").select "0"
@browser.link(:id => "uw_flight_submit_lnk").click