class RSemptyFields < Test


  def did_test_pass
    text_fields = [
      @driver.find_element(:id, "username"),
      @driver.find_element(:id, "dateFrom"),
      @driver.find_element(:id, "dateTo")
    ]
    text_fields.each do |field|
      if (field.displayed?) then
        # puts "text field contains: #{field.text}"
        if (field.text != "")
          return false
        end
      end
    end
    return true
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    #nothing for this test
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

  def is_ready_to_perform
    #optional implimentation
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

end
