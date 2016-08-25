class OCMbannerLogo < Test #TODO: Change name


  def did_test_pass
    logo = @driver.find_element(:id, "banner_img")
    if (logo.attribute("alt") == "Banner Image")
      if (logo.attribute("src") == "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_mainScreen_bkg-blueBanner.png") #varies by version
        return true
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

end
