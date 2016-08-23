class VEFcolumnHeaderIcons < Test


  def did_test_pass
    did_pass = true
    column_names = ["Document", "Photo", "Video", "Audio", "Email"]
    column_names.each do |column_name|
      img_element = @driver.find_element(:xpath, "//th[@id = '#{column_name}']/img")
      # puts "img_element.attribute('src'): #{img_element.attribute('src')}"
      if (img_element.displayed?) then
        if(img_element.attribute("src") != "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/#{column_name.downcase}.png") then
          didPass = false
        end
      else
        didPass = false
      end
    end
    return did_pass
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
