require_relative 'linker'

class Plantation

  @browsers_to_test = []
  @drivers_to_test = []
  @tests_to_run = []
  #array [totalTestsRun, totalTestsFailed]
  @total_results = [0,0]
  @all_browsers = [:firefox, :safari, :chrome, :ie]

  def update_results(results)
    @total_results[0] += results[0]
    @total_results[1] += results[1]
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def reset_results
    @total_results = [0,0]
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def initialize(*args)
    @all_browsers = [:firefox, :safari, :chrome, :ie]
    @browsers_to_test = []
    @drivers_to_test = []
    @tests_to_run = []
    if(args[0].nil?) then
      display_main_menu
    else
      #puts "args: #{args}"
      @tests_to_run = [get_test_by_name(name: args[0])]
      @browsers_to_test = [args[1].to_sym]
      display_main_menu
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def faux_clear_screen
    puts "\n"*30
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def run_choices
    @total_results = [0,0]
    @browsers_to_test.each do |browser|
      if (@drivers_to_test.count > 0) then
        @drivers_to_test.each do |driver|
          update_results(driver.new(target: browser).run_tests)
        end
      end
      if (@tests_to_run.count > 0) then
        update_results(TestDriver.new(target: browser, tests: @tests_to_run).run_tests)
      end
    end
    puts "***********************RESULTS*********************** #{@total_results[0].to_s} tests run, #{@total_results[1].to_s} tests failed!"
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def display_current_choices
    puts "************************************************************************"
    puts "         Chosen Browsers:      #{@browsers_to_test}"
    puts "          Chosen Drivers:      #{@drivers_to_test}"
    puts " Chosen Individual Tests:      #{@tests_to_run}"
    puts "************************************************************************"
    puts "\n"*3
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def display_main_menu_choices
    puts "1. Run"
    puts "2. Choose Browser(s)"
    puts "3. Choose Driver(s)"
    puts "4. Choose Individual Test(s)"
    puts "5. Quit"
    puts "\n"*3
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def display_all_browsers
    puts "Browsers:"
    @all_browsers.each_with_index do |browser, index|
      puts "#{index+1}. #{browser}"
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def display_all_test_drivers
    puts "Test Drivers:"
    $testDrivers.each_with_index do |driver, index|
      puts "#{index+1}. #{driver}"
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def display_all_tests
    puts "Tests:"
    i=0
    $testDrivers.each do |testDriver|
      testDriver.new.get_tests.each do |specific_test|
        puts "#{i+1}. #{specific_test}"
        i+=1
      end
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def update_browsers_to_test(browser_indexes: [])
    @browsers_to_test = []
    browser_indexes.each do |browser_index|
      @browsers_to_test.push(@all_browsers[browser_index.to_i-1])
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def update_drivers_to_test(driver_indexes: [])
    @drivers_to_test = []
    driver_indexes.each do |driver_index|
      @drivers_to_test.push($testDrivers[driver_index.to_i-1])
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def update_tests_to_run(test_indexes: [])
    @tests_to_run = []
    test_indexes.each do |test_index|
      i=0
      #TODO: create method for building the test list and just reference that.
      $testDrivers.each do |testDriver|
        testDriver.new.get_tests.each do |specific_test|
          if ((test_index.to_i-1) == i) then
            @tests_to_run.push(specific_test)
          end
          i+=1
        end
      end
    end
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def display_main_menu
    faux_clear_screen
    display_current_choices
    display_main_menu_choices
    puts "Please enter choosen index:"
    STDIN.flush
    selected_menu_choice = STDIN.gets.chomp
    case selected_menu_choice.to_i
    when 1
      run_choices
    when 2
      choose_browsers
    when 3
      choose_drivers
    when 4
      choose_tests
    when 5
      exit
    else
      puts "Invlalid choice!"
      display_main_menu
    end

  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def choose_browsers
    display_all_browsers
    puts "Please enter choosen index(es):"
    STDIN.flush
    input = STDIN.gets.chomp
    chosen_browser_indexes = input.split
    update_browsers_to_test(browser_indexes: chosen_browser_indexes)
    display_main_menu
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def choose_drivers
    display_all_test_drivers
    puts "Please enter choosen index(es):"
    STDIN.flush
    input = STDIN.gets.chomp
    chosen_driver_indexes = input.split
    update_drivers_to_test(driver_indexes: chosen_driver_indexes)
    display_main_menu
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def choose_tests
    display_all_tests
    puts "Please enter choosen index(es):"
    STDIN.flush
    input = STDIN.gets.chomp
    chosen_test_indexes = input.split
    update_tests_to_run(test_indexes: chosen_test_indexes)
    display_main_menu
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

  def get_test_by_name(name: "")
    #TODO: create method for building the test list and just reference that.
    $testDrivers.each do |testDriver|
      testDriver.new.get_tests.each do |specific_test|
        #puts "specific_test.name: #{specific_test.name}, and name: #{name}"
        if (specific_test.name == name) then
          return specific_test
        end
      end
    end
    return ""
  rescue => e
    puts "An error has occurred in #{self.class.name}.#{__method__}"
    puts e.message
  end

end
