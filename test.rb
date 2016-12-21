require_relative "cookbook"
require_relative "view"
require_relative "controller"


file_path = "recipes.csv"
cookbook = Cookbook.new(file_path)
vista = View.new
recipe_test = Recipe.new("test", "test")
controller = Controller.new(cookbook)

#controller.create
#puts "------------------------------"
controller.list
puts "------------------------------"
controller.destroy
puts "------------------------------"
controller.list
