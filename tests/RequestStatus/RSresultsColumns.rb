class RSresultsColumns < Test


  def did_test_pass
    didPass = true
    expect_headers = [
      "Type",
      "Reference Id",
      "Case/Operation Number",
      "Status",
      "Requested At"
    ]
    (1..5).each do |num|
      col_header = @driver.find_element(:xpath, "//*[@id='case_table']/thead/tr/th[#{num}]")
      # puts col_header.text
      # puts expect_headers[num - 1]
      if (col_header.text != expect_headers[num - 1])
        didPass = false
      end
    end
    return didPass
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
    link_finder = RSresultsDisplay.new(target: @target_browser, keep: true, driver: @driver)
    link_finder.run
    @driver = link_finder.get_driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
