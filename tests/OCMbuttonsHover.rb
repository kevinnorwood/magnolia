class OCMbuttonsHover < Test #TODO: Change name


  def did_test_pass
    # button = @driver.find_elements(:class, "focus")
    buttons = [
      @driver.find_element(:id, "viewExternal"),
      @driver.find_element(:id, "help"),
      @driver.find_element(:id, "requestPhotos"),
      @driver.find_element(:id, "requestRedaction"),
      @driver.find_element(:id, "requestStatus"),
      @driver.find_element(:id, "upload"),
      @driver.find_element(:id, "contact")
    ]
    focusHover = [
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_viewExtFile-selected.png",
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_help-selected.png",
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_requestPhotos-selected.png",
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_requestRedaction-selected.png",
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_requestStatus-selected.png",
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_Upload-selected.png",
      "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_home_button_Contact-selected.png"
    ]
    buttons.each_with_index do |elem, index|
      @driver.action.move_to(elem).perform()
      if elem.attribute("src") != focusHover[index]
        return false
      end
      # sleep 2
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
