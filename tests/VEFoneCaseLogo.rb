class VEFoneCaseLogo < Test


  def did_test_pass
    logo_banner = @driver.find_element(:id, "banner_img")
    if (logo_banner.displayed?) then
      if(logo_banner.attribute("src") == "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/oneCase_mainScreen_bkg-blueBanner.png") then
        return true
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
    #Nothing extra to do for this test
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
