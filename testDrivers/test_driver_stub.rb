class TestDriverSubClass < TestDriver #TODO: Change name

  def set_tests(tests: [])
    [
      #Member tests
    ].each do |test|
      add_member_test(test)
    end
  rescue => e
    puts "An error has occourred running test driver for #{self.class.name}:"
    puts e.message
  end
end
