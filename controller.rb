require_relative "view"
require_relative "marmiton"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @marmiton = Marmiton.new
  end

  def list
    recipes_array = @cookbook.all #vamos a buscar todas las recetas dentro de cookbook
    @view.list_all(recipes_array) #llamamos el metodo list_all de view con el argumento temp (array de recipes)
  end

  def create
    recipe_array = @view.add # array [name, description]
    recipe = Recipe.new(recipe_array[0], recipe_array[1]) # transformer array en Recipe object
    if @cookbook.add_recipe(recipe) #Recipe object
      @view.congrats
    else
      @view.failures
      create
    end
  end

  def destroy
    recipe_index = @view.remove
    @cookbook.remove_recipe(recipe_index)
    @view.removed_message
  end

  def search_online
    ingredient = @view.ask_ingredient
    marmiton_array = @marmiton.search(ingredient) # Returns an array with the searched recipes
    @view.print_result(ingredient,marmiton_array)
    recipe_index = @view.select_to_import # Returns index of recipe in marmiton array
    @cookbook.add_recipe(marmiton_array[recipe_index])
  end
end


