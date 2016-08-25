class RStypeDate < Test


  def did_test_pass
    didPass = true
    t = Time.now
    dateFields = [
      @driver.find_element(:id, "dateFrom"),
      @driver.find_element(:id, "dateTo")
    ]
    dateFields.each do |field|
      field.click
      field.send_keys("#{t.strftime('%D')}")
      calendar = @driver.find_element(:id, "ui-datepicker-div")
      cal_month = @driver.find_element(:class, "ui-datepicker-month")
      cal_year = @driver.find_element(:class, "ui-datepicker-year")
      # puts calendar.displayed?
      if (calendar.displayed?) then
        if (cal_month.text == t.strftime("%B")) then #current month
          if (cal_year.text != t.strftime("%Y")) #current year
            didPass = false
          end
        else
          didPass = false
        end
      else
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
    #nothing here
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
