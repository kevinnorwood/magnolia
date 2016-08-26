class RequestStatus < TestDriver #TODO: Change name

  def set_tests(tests: [])
    [
      RSbuttonExists,
      RSbuttonClick,
      RScaseNumbersDisplayed,
      RStitleIconDisplayed,
      RSbannerDisplayed,
      RSemptyFields,
      RSsubmitButtonExists,
      RSsubmitButtonColor,
      RSclickFromField,
      RSclickToField,
      RScalFromArrows,
      RScalToArrows,
      RScalendarIcons,
      RSclickFromIcon,
      RSclickToIcon,
      RStypeDate,
      RScalClickFromDate,
      RScalClickToDate,
      RScalFirstWeek,
      RSusernameCase,
      RSsearchProcessRequest,
      RSresultsDisplay
    ].each do |test|
      add_member_test(test)
    end
  rescue => e
    puts "An error has occourred running test driver for #{self.class.name}:"
    puts e.message
  end
end
