class RSbuttonClick < Test #TODO: Change name


  def did_test_pass
    # puts "driver.current_url: #{@driver.current_url}"
    # puts "driver.title: #{@driver.title}"
    if(@driver.current_url == "https://qa1.neuone.com/rhamilton/onecase4200/index.php/request/status") then
      if(@driver.title == "Request Status") then
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
    # puts "RSlink: #{@RSlink}"
    # puts "RSlink.class: #{@RSlink.class}"
    # puts "RSlink.methods: #{@RSlink.methods}"
    vefimg = @RSlink.find_element(:id, "requestStatus")
    vefimg.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until { @driver.title.downcase.start_with? "request status" }
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = RSbuttonExists.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
    @RSlink = link_finder.get_link
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
