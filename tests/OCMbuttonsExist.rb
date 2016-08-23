class OCMbuttonsExist < Test #TODO: Change name


  def did_test_pass
    buttonsDisplay = @driver.find_elements(:class, "focus")
    focusArray = ["viewExternal",
      "help",
      "requestPhotos",
      "requestRedaction",
      "requestStatus",
      "upload",
      "contact"
    ]
    buttonsDisplay.each_with_index do |elem, index|
      if (elem.attribute('focusele') != focusArray[index]) then
      #   puts "#{elem.attribute('focusele')} = #{focusArray[index]}"
      # else
        return false
      end
    end
    return true
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    #TODO: Impliment
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

end
