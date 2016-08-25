class OCMnotesExist < Test #TODO: Change name


  def did_test_pass
    notes_bubble = @driver.find_element(:id, "notification")
    notes_text = @driver.find_element(:id, "notifications")
    if notes_bubble.attribute("src") == "https://qa1.neuone.com/esd3.7.4/template/esd/tpl/image/getImageHtml/oneCase_mainScreen_notificationBubble.png" #varies by version
      # puts notes_text.text.split()[0]
      if notes_text.text.split()[0] == "notes"
        return true
      end
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
