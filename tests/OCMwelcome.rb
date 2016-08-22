class OCMwelcome < Test #TODO: Change name


  def did_test_pass
    greeting = @driver.find_element(:id, "greeting")
    # puts "greeting methods: #{greeting.text}"
    if (@driver.title == "OneCase")
      if (greeting.text == "Welcome!")
        return true
      end
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    @driver = Selenium::WebDriver.for @target_browser
    @driver.get $OC_DIRECT_URL

  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    #optional implimentation
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
