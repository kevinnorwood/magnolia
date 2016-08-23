class VEFrequestResearchLinkClick < Test


  def did_test_pass
    #puts "driver.current_url: #{@driver.current_url}"
    #puts "driver.title: #{@driver.title}"
    if(@driver.current_url == "https://qa1.neuone.com/rhamilton/onecase4200/index.php/request/cases") then
      if(@driver.title == "Request Research") then
        return true
      else
        return false
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
    @request_research_link_img.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until { @driver.title.downcase.start_with? "request research" }
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = VEFrequestResearchLinkExists.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
    @request_research_link_img = link_finder.get_link
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
