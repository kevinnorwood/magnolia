class RScalendarIcons < Test #TODO: Change name


  def did_test_pass
    did_pass = true
    icon_source = "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/calendar.png"
    cal_icons = ["calFrom", "calTo"]
    cal_icons.each do |icon|
      cal_icon = @driver.find_element(:xpath, "//img[@id = '#{icon}']")
      # puts cal_icon.attribute("src")
      if (cal_icon.displayed?) then
        if (cal_icon.attribute("src") != icon_source)
          did_pass = false
        end
      else
        did_pass = false
      end
    end
    return did_pass
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

  def is_ready_to_perform
    #optional implimentation
    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

end
