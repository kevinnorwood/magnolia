class RScalFirstWeek < Test


  def did_test_pass
    didPass = true
    (1..7).each do |num|
      @date_field.click
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      wait.until { (@driver.find_element(:id, 'ui-datepicker-div')).displayed? }
      day = @driver.find_element(:xpath, "//*[@id='ui-datepicker-div']/table/tbody/tr[1]/td[#{num}]/a")
      day.click
      # puts @date_field.attribute("value")
      # puts "10/0#{day.text}/2000"
      if (@date_field.attribute("value") != "10/0#{day.text}/2000")
        didPass = false
      end
    end
    return didPass
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    @date_field = @driver.find_element(:id, "dateTo")
    @date_field.send_keys("10/31/2000") # any month beginning on a sunday will work
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = RSclickToField.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
