class RSusernameCase < Test

  def did_test_pass
    if @column1.nil? || @column2.nil?
      return false      
    end
    if @column1 == @column2
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
    search("jsmith")
    @column1 = (@driver.find_element(:xpath, "//tbody[@id = 'case_info']/tr/td[2]")).text
    search("JSMITH")
    @column2 = (@driver.find_element(:xpath, "//tbody[@id = 'case_info']/tr/td[2]")).text
    # puts @column1
    # puts @column2
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

  def search(namecase)
    @t = Time.now
    username = @driver.find_element(:id, "username")
    dateFrom = @driver.find_element(:id, "dateFrom")
    dateTo = @driver.find_element(:id, "dateTo")
    search_button = @driver.find_element(:link, "Submit")
    column_header = @driver.find_element(:xpath, "//table[@id = 'case_table']/thead/tr/th[1]")
    username.send_keys(namecase) #define namecase
    dateFrom.send_keys("01/01/2012")
    dateTo.send_keys("#{@t.strftime('%D')}")
    search_button.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { column_header.displayed? }
    # sleep 2
  end

end
