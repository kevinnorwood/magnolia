class RScaseNumbersDisplayed < Test #TODO: Change name


  def did_test_pass
    my_cases = @driver.find_element(:id, "my_cases")
    puts "my_cases.text: #{my_cases.text}"
    if (my_cases.text == "99999901, 123456, 654321") then
      return true
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
