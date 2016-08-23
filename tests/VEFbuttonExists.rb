class VEFbuttonExists < Test


  def did_test_pass
    focus_elements = @driver.find_elements(:class, "focus")
    #puts "focus_elements: #{focus_elements}"
    found = false
    index = 0
    until found
      #puts "focus_elements[#{index}]: #{focus_elements[index].attribute('focusele')}"
      if(focus_elements[index].attribute('focusele') == "viewExternal") then
        found = true
      else
        index += 1
      end
    end

    if (focus_elements[index].displayed?) then
      @button = focus_elements[index]
      return true
    else
      return false
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    #Nothing extra to do for this test
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    loader = OCMlaunchECase.new(target: @target_browser, keep: true)
    loader.run
    @driver = loader.get_driver
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

  def get_link
    return @button.nil? ? nil : @button
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

end
