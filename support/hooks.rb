Before do
  @browser = Watir::Browser.new
end

at_exit do
  @browser.close
end