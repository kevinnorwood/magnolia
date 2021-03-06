class RResSubmitForm < Test


  def did_test_pass
    wait = Selenium::WebDriver::Wait.new(:timeout => 5400, :interval => 1)
    wait.until { @driver.title == "View External File" }
    # puts @driver.current_url
    if (@driver.current_url == "https://qa1.neuone.com/rhamilton/onecase4200/index.php/request/external#")
      if (@driver.title == "View External File")
        if ((@driver.find_element(:xpath, "//*[@id='requestRedactionResultDiv']/span/h3")).displayed?)
          return true
        end
      end
    end
  return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    text_input = ['Windows','First_Name','Last_Name','Address','City','Zip']
    values = ['jsmith','John','Smith','21 Jump Street','Houston','77014']
    dropdown = ['State', 'request_type']
    dvalues = ['193', '550']
    go = @driver.find_element(:id, "go_button")
    if (@driver.title.downcase.start_with? "request research")
      (0..5).each do |num|
        field = @driver.find_element(:id, "#{text_input[num]}")
        if (field.attribute("value") == "")
          field.send_keys("#{values[num]}")
        end
      # puts field.attribute("value")
      end
      (0..1).each do |num|
        menu = @driver.find_element(:id, "#{dropdown[num]}")
        menu.find_element(:css, "option[value = '#{dvalues[num]}']").click
      end
    end
    go.click

  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    link_finder = VEFrequestResearchLinkClick.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end


end
