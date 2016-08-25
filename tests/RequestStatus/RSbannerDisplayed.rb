class RSbannerDisplayed < Test


  def did_test_pass
    banner = @driver.find_element(:id, "banner_img")
    if (banner.displayed?) then
      if (banner.attribute("src") == "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/oneCase_mainScreen_bkg-blueBanner.png")
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

end
