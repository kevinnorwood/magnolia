class VEFlistenToAudioBackButtonClick < Test


  def did_test_pass
    if (@driver.window_handles.count == 1) then
      @driver.switch_to.window(@driver.window_handles[0])
      if(@driver.current_url == 'https://qa1.neuone.com/rhamilton/onecase4200/index.php/request/external#') then
        if(@driver.title == "View External File") then
          return true
        else
          return false
        end
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
    @first_window = @driver.window_handle
    tbod = @driver.find_elements(:xpath, "//tbody[@id = 'tbod']/tr")
    tbod.each_with_index do |tr, index|
      inner_elements = get_elements(index, "th")
      if inner_elements.count == 0 then
        #puts "#{tr} does not contain th tags"
        inner_elements = get_elements(index, "td")
        if inner_elements.count > 0 then
          #puts "#{tr} contains td tags"
          #puts "#{inner_elements[1].text}: #{inner_elements[2].text}"
          if (inner_elements[5].text == "Listen to Audio") then
            view_doc_link = inner_elements[5].find_element(:xpath, ".//a")
            view_doc_link.click
            all_windows = @driver.window_handles
            new_window = all_windows.select { |this_window| this_window != @first_window }
            @driver.switch_to.window(new_window)
            sleep 3
            back_button = @driver.find_element(:xpath, "//div[@class = 'button short']")
            inner_link = back_button.find_element(:xpath, './/a')
            #check for survey, if present, dismiss it
            survey_div = @driver.find_element(:id, "initial-onecase")
            if (survey_div.displayed? == true) then
              no_button = survey_div.find_element(:link, "No, Not right now.")
              no_button.click
              close_button = @driver.find_element(:id, "onecase-close")
              close_button.click
            end
            inner_link.click
            return
          end
          #has no td elements
        end
      else
        #has th elements,
      end
    end
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
