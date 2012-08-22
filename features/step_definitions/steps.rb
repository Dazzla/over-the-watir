require File.join(File.dirname(__FILE__), '..', '..', 'pages', 'brand_flight_search_page')
require "rubygems"
#require "watir-webdriver"

Given /^I want to use (\w+) to search for flights$/ do |brand|
  @brand = brand.downcase
end

And /^I am on (http:\/\/www\.expedia\.co\.uk\/Flights)/ do |page|
  #@browser = Watir::Browser.new
  @flight_search_page = BrandFlightsPage.new(@browser, page, @brand)
  @flight_search_page.visit
  @browser.link(:text => "No thanks").when_present.click
end

When /^I select a (one\-way|return) flight$/ do |itinerary|
  @flight_search_page.set_journey_type itinerary
end

When /^I choose a flight from (.{3}) to (.{3}) for (\d+) adults?, (\d+) child|ren and (\d+) infants?$/ do |orig, dest, adults, children, infants|
  @orig = orig
  @dest = dest
  @flight_search_page.set_origin orig
  @flight_search_page.set_destination dest
  @flight_search_page.set_number_of_adults adults
end

And /^I set the (departure) date to be (\d+)\/(\d+)\/(\d+)$/ do |itinerary, dd, mm, yyyy|
  @itinerary = itinerary
  departure_date = "#{dd}/#{mm}/#{yyyy}"
  @flight_search_page.set_departure_date(departure_date)
end

And /^I set the (return) date to be (\d+)\/(\d+)\/(\d+)$/ do |itinerary, dd, mm, yyyy|
  @itinerary = itinerary
  return_date = "#{dd}/#{mm}/#{yyyy}"
  @flight_search_page.set_return_date(return_date)
end

And /^I click the "(.*?)" button$/ do |submit_type|
  @flight_search_page.submit_search
end

Then /^I see a results page for a (return|one\-way) flight search$/ do |type|
  if type === "one-way"
    @flight_search_page.page_title.should eq("Complete trips - #@orig to #@dest")
  else
    @flight_search_page.page_title.should eq("Build your own trip - #@orig to #@dest")
  end
end

Then /^I see a page title telling me that no flights have been found$/ do
    @flight_search_page.page_title.should eq("No flights were found that matched your request")
end
