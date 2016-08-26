class RSsubmitButtonColor < Test


  def did_test_pass
    submit_button = @driver.find_element(:xpath, "//*[@id='body']/table[1]/tbody/tr/td[4]/a")
    if (submit_button.displayed?) then
      if (submit_button.css_value("background-image") == "linear-gradient(rgb(0, 136, 204), rgb(0, 68, 204))") then
        # puts submit_button.css_value("color")
        if (submit_button.css_value("color") == "rgba(255, 255, 255, 1)")
          return true
        else
          return false
        end
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
