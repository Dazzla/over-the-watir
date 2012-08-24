require File.expand_path(File.dirname(__FILE__) + '/flight_search_page')

class SetFieldsByType <  FlightSearchPage
    def text_field(method_name)
      define_method(method_name) do |method_name, data|
        self.text_field(method_name[:attribute] => method_name[:origin]).set data
      end
    end
end