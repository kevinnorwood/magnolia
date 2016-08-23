class VEFtitleIconDisplayed < Test


  def did_test_pass
    title_icon = @driver.find_element(:id, "external")
    if (title_icon.displayed?) then
      if(title_icon.attribute("src") == "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/oneCase_icon_externalFiles-scaled.png") then
        return true
      else
        return false
      end
    else
      return false
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    #Nothing else to do for this test
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    loader = VEFbuttonClick.new(target: @target_browser, keep: true, driver: @driver)
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
