class VEFtabNamesNotDuplicated < Test


  def did_test_pass
    didPass = true
    tbod = @driver.find_elements(:xpath, "//tbody[@id = 'tbod']/tr")
    tab_names = []
    tbod.each_with_index do |tr, index|
      inner_elements = get_elements(index, "th")
      if inner_elements.count == 0 then
        #puts "#{tr} does not contain th tags"
        inner_elements = get_elements(index, "td")
        if inner_elements.count > 0 then
          #puts "#{tr} contains td tags"
          if (tab_names.include? inner_elements[1].text) then
            didPass = false
          else
            tab_names.push(inner_elements[1].text)
          end
          #puts "#{tab_names}\n"
        end
      else
        #has th elements, new case, reset names
        tab_names = []
        #puts "new case\n\n"
      end
    end


    return didPass
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return false
  end

  def perform
    #Nothing extra to do for this tests
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

  def get_elements(index, tag_type)
    #puts "getting elements at index: #{index} with type:#{tag_type}"
    elements = @driver.find_elements(:xpath, "//tbody[@id = 'tbod']/tr[#{index}]/#{tag_type}")
    return elements
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
    return nil
  end

end
