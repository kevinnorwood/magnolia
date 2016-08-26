class RSclickFromIcon < Test


  def did_test_pass
    calendar = @driver.find_element(:id, 'ui-datepicker-div')
    if (calendar.displayed?)
      return true
    end
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    icon = @driver.find_element(:xpath, "//img[@id = 'calFrom']")
    icon.click
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
