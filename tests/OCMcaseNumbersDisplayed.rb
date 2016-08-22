class OCMcaseNumbersDisplayed < Test


  def did_test_pass
    my_cases = @driver.find_element(:id, "my_cases")
    puts "my_cases.text: #{my_cases.text}"
    if (my_cases.text == "99999901, 123456, 654321") then
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
    #Nothing extra needs to be done for this test
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
