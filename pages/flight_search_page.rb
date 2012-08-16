class FlightSearchPage
  


  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end
  
  def page_title
    @browser.title
  end

end