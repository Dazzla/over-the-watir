class BrandConfigurator
  #Will fetch the element selectors from yaml config files
  require 'yaml'

  attr_reader :route, :date, :itinerary_type, :no_of_pax,
              :no_results_error_container_element, :submit_button_element


  def initialize(brand)
    #Used to select correct element configurations to give brand flexibility
    #Will eventually use a config file - hard-coded stub for now.
    #brand is specified by the customer in the features file
    config_file = File.join(File.dirname(__FILE__), '..', 'config', 'site_config.yml')

    config = YAML.load_file config_file


    @brand          = brand
    @route          = config[:route]
    @date           = config[:date]
    @itinerary_type = config[:itinerary_type]
    @no_of_pax      = config[:no_of_pax]

    @no_results_error_container_element = config[:user_messages][:no_results_error_container_element]
    @submit_button_element              = config[:generic_page_elements][:submit_button_element]
  end

end