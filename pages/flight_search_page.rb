class FlightSearchPage

  def initialize(browser, page)
    @browser      = browser
    @start_url    = page
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def page_title
    #Returns contents of <title> tag in current page.
    @browser.title
  end

end