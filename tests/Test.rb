class Test

  @should_keep
  @target_browser
  @driver
  @verbose

  def initialize(target: :firefox, keep: true, driver: nil, verbose: false)
    @target_browser = target
    @should_keep = keep
    @driver = driver
    @verbose = verbose
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def did_test_pass

    return false
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def perform

  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def prepare_to_perform

  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def teardown
    @should_keep? nil : @driver.quit
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def run
    @verbose ? (puts "running #{self.class.name} test in #{@target_browser}") : nil
    prepare_to_perform
    perform
    @verbose ? (puts "#{self.class.name} test completed running in #{@target_browser}... checking..") : nil
    didPass = did_test_pass
    @verbose ? (puts "#{self.class.name} test #{didPass ? "passed" : "did *******NOT******* pass"} in #{@target_browser}") : nil
    teardown
    return didPass
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def get_driver
    return @driver
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
