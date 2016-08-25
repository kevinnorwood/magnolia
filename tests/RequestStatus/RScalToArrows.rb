class RScalToArrows < Test


  def did_test_pass
    calendar = @driver.find_element(:id, "ui-datepicker-div")
    if (calendar.displayed?) then
      @driver.find_element(:xpath, "//span[@class = 'ui-icon ui-icon-circle-triangle-w']").click
      if (@driver.find_element(:class, "ui-datepicker-month").text != "December") then
        return false
      else
        @driver.find_element(:xpath, "//span[@class = 'ui-icon ui-icon-circle-triangle-e']").click
        if (@driver.find_element(:class, "ui-datepicker-month").text != "January")
          return false
        else
          return true
        end
      end
    end
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    @driver.find_element(:id, "dateTo").send_keys("01/01/2000")
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
