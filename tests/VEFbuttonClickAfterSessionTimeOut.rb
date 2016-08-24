class VEFbuttonClickAfterSessionTimeOut < Test


  def did_test_pass
    #TODO: check for the correct error message
    #puts "driver.current_url: #{@driver.current_url}"
    #puts "driver.title: #{@driver.title}"
    if(@driver.current_url == "https://qa1.neuone.com/rhamilton/onecase4200/index.php/request/external") then
      if(@driver.title == "View External File") then
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
    time_then = Time.now
    vefimg = @VEFlink.find_element(:id, "viewExternal")
    wait = Selenium::WebDriver::Wait.new(:timeout => 5400, :interval => 1)
    wait.until { Time.now- time_then > 10 } #should be 3601
    vefimg.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until { @driver.title.downcase.start_with? "view external file" }
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = VEFbuttonExists.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
    @VEFlink = link_finder.get_link
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
