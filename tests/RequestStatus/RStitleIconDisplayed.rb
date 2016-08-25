class RStitleIconDisplayed < Test #TODO: Change name


  def did_test_pass
    title_icon = @driver.find_element(:id, "request_status")
    if (title_icon.displayed?) then
      if(title_icon.attribute("src") == "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/oneCase_home_button_requestStatus-unselected.png") then
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
    #TODO: Impliment
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
