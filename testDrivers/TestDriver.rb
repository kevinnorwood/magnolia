class TestDriver

  @member_tests
  @should_keep
  @target_browser

  def initialize(target: :firefox, keep: false, tests: [])
    @target_browser = target
    @should_keep = keep
    @member_tests = []
    set_tests(tests: tests)
  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def run_tests
    puts "Running test driver for #{self.class.name} in #{@target_browser}"
    @tests_run = 0
    tests_failed = 0
    @member_tests.each do |pending_test|
      @tests_run += 1
      tests_failed += pending_test.new(target: @target_browser, keep: @should_keep, verbose: true).run ? 0 : 1
    end

    #spit out results of tests for this class
    puts "********RESULTS******** #{@tests_run.to_s} tests run, #{tests_failed.to_s} tests failed for #{self.class.name} in #{@target_browser}"
    return [@tests_run, tests_failed]
  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def set_tests(tests: [])
    #Intended to be overwritten by subclasses
    tests.each do |test|
      @member_tests.push(test)
    end
  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def get_tests
    return @member_tests
  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def add_member_test(test)
    @member_tests.push(test)
  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end


end
