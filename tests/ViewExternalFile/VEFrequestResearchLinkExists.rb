class VEFrequestResearchLinkExists < Test


  def did_test_pass
    request_research_img = @driver.find_element(:id, "request_research")
    if (request_research_img.displayed?) then
      if(request_research_img.attribute("src") == "https://qa1.neuone.com/rhamilton/onecase4200/app/webroot/img/request/oneCase_requestResearch_icon.png") then
        @request_research_img = request_research_img
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

  def get_link
    return @request_research_img.nil? ? nil : @request_research_img
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

end
