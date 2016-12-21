require_relative "controller.rb"

class Router
 def initialize(controller) # Controller as an argument as we are going to need method from the controller
  @controller = controller
  @stop = false
 end

 def run
  while @stop == false
    puts ""
    puts "WELCOME TO COOKBOOK"
    puts "-------------------"
    display_options
    option = gets.chomp.to_i
    case option
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.search_online
    when 5 # If you have several statements, "then" is not mandatory
     puts "Thanks for using cookbook"
     @stop = true
    else puts "Please enter one of the options"
    end
  end
 end
  #

 def display_options
  puts "Select an option"
  puts "1- List"
  puts "2- Create"
  puts "3- Destroy"
  puts "4- Import recipes from Marmiton"
  puts "5- Exit"
 end
end
