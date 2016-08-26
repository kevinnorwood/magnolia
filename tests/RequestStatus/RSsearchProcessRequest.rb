class RSsearchProcessRequest < Test

  # Error if click “Submit” and not all field have been entered

  def did_test_pass
    processing_request = @driver.find_element(:xpath, "//*[@id='requestInformation']/font")
    # puts processing_request.text
    if (processing_request.displayed?)
      return true
    end
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    @driver.find_element(:id, "username").send_keys("jsmith")
    @driver.find_element(:id, "dateFrom").send_keys("01/01/2000")
    @driver.find_element(:id, "dateTo").send_keys("#{Time.now.strftime('%D')}")
    @driver.find_element(:xpath, "//*[@id='body']/table[1]/tbody/tr/td[4]/a").click
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = RSbuttonClick.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
