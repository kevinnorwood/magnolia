class ViewExternalFile < TestDriver

  def set_tests(tests: [])
    [
      VEFbuttonExists,
      VEFbuttonClick,
      #VEFbuttonClickAfterSessionTimeOut,
      VEFtitleIconDisplayed,
      VEFoneCaseLogo,
      VEFrequestResearchLinkExists,
      VEFrequestResearchLinkClick,
      VEFcolumnHeaderIcons,
      VEFviewDocumentClick,
      VEFtabNames2ndColumn,
      VEFtabNamesNotDuplicated,
      VEFviewDocumentLinksExists,
      VEFNDEbackButtonClick,
      VEFviewPhotoLinksExists
    ].each do |test|
      add_member_test(test)
    end
  rescue => e
    puts "An error has occourred running test driver for #{self.class.name}:"
    puts e.message
  end
end
