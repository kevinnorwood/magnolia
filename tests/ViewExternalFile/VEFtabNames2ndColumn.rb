class VEFtabNames2ndColumn < Test


  def did_test_pass
    tab_names = ["Legal",
                "Investigation",
                "Adults Family Medical/Mental Health",
                "Correspondence",
                "Post Closure Activities",
                "Adoption",
                "Family Services",
                "Childs Service Plans",
                "Childs Educational Records",
                "Legacy",
                "APS In-Home"]
    didPass = true
    tbod = @driver.find_elements(:xpath, "//tbody[@id = 'tbod']/tr")
    #puts "tbod: #{tbod}"
    tbod.each_with_index do |tr, index|
      #puts "inspecting #{tr}(index:#{index})"
      inner_elements = get_elements(index, "th")
      if inner_elements.count == 0 then
        #puts "#{tr} does not contain th tags"
        inner_elements = get_elements(index, "td")
        if inner_elements.count > 0 then
          #puts "#{tr} contains td tags"
          inner_elements.each_with_index do |element, index|
            #puts "element.text: #{element.text} at index: #{index}"
            if (tab_names.include? element.text) then
              didPass = (index == 1) ? didPass : false
            else
              didPass = (index == 1) ? false : didPass
            end
            puts didPass
          end
        end
      else
        #has th elements
        #puts "#{tr} has th tags"
        #puts "inner_elements: #{inner_elements}"
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
