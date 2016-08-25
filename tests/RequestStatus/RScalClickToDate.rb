class RScalClickToDate < Test


  def did_test_pass
    # puts @date_field.attribute("value")
    if (@date_field.attribute("value") == "02/01/1992")
      return true
    end
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    @date_field = @driver.find_element(:id, "dateTo")
    @date_field.send_keys("02/24/1992")
    calendar = @driver.find_element(:id, 'ui-datepicker-div')
    day = @driver.find_element(:xpath, "//*[@id='ui-datepicker-div']/table/tbody/tr[1]/td[7]/a")
    # puts day.text
    day.click
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
