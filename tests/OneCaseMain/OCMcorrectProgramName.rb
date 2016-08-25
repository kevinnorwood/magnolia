class OCMcorrectProgramName < Test


  def did_test_pass
    title_type = @driver.find_element(:id, "title_type")
    if (title_type.text == "CPS") then
      return true
    else
      return false
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    #Nothing extra needs to be done for this test
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform
    loader = OCMlaunchECase.new(target: @target_browser, keep: true)
    loader.run
    @driver = loader.get_driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
