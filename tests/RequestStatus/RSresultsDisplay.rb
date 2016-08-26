class RSresultsDisplay < Test


  def did_test_pass
    table = @driver.find_element(:xpath, "//*[@id='case_table']/thead/tr/th[1]")
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until { table.displayed? }
    if (table.displayed?)
      return true
    end
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    # nothing here
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = RSsearchProcessRequest.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
