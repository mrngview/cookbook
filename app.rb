require_relative "router"
require_relative "cookbook"
require_relative "controller"


CSV_FILE = File.join(File.dirname(__FILE__), 'recipes.csv') # also works only with variable = file_path / CSV_FILE = 'recipes.csv'
cookbook = Cookbook.new(CSV_FILE)
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run
