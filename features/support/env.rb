TEST_DATA_DIR = "./features/test_data"

URL_CAPTURE = Transform /http:\/\/(?:www.)?\S+\.(?:co\.uk|com)(?:\/\S+)/  do |url|
  url.to_s
end

require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new
end

After do
  @browser.close
end