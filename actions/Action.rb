class Action

  def initialize()

  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def perform

  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def get_driver
    return @driver.nil? ? nil : @driver
  rescue => e
    puts "An error has occoured in #{self.class.name}.#{__method__}"
    puts e.message
  end
  
end
