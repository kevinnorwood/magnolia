class RSdateToCalendar < Test


  def did_test_pass
    t = Time.now
    calendar = @driver.find_element(:id, "ui-datepicker-div")
    cal_month = @driver.find_element(:class, "ui-datepicker-month")
    cal_year = @driver.find_element(:class, "ui-datepicker-year")
    if (calendar.displayed?) then
      # puts cal_month.text
      # puts cal_year.text
      if (cal_month.text == t.strftime("%B")) then #current month
        if (cal_year.text == t.strftime("%Y")) #current year
          return true
        else
          return false
        end
      else
        return false
      end
    else
      return false
    end
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    dateTo = @driver.find_element(:id, "dateTo")
    dateTo.click
    # sleep 2
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
