class OCMlaunchECase < Test


  def did_test_pass
    if (@driver.title == "OneCase")
      #puts "@driver.current_url: #{@driver.current_url}"
      if(@driver.current_url.start_with?("https://qa1.neuone.com/esd3.7.4/api.php?function=GetImageHtml_securedfps&token="))
        didPass = true
      else
        didPass = false
      end
    else
      didPass = false
    end
    # wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    #   wait.until { @driver.title.downcase.start_with? "neudocs enterprise template key search" }
    return didPass
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

end
