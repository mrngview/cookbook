# DATABASE

require_relative "recipe"
require "csv"


class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_recipes
  end

  def load_recipes # La llamamos en initialize para que nos de las recetas del csv en un array
    CSV.foreach(@csv_file) do |row| #Parse the file
    recipe = Recipe.new(row[0], row[1]) #store name and desc. in recipe object
    @recipes << recipe #push recipe in []
    end
    return @recipes #return array of recipes objects
  end

  def add_recipe(recipe) #Recipe object as argument
    @recipes << recipe
    store_to_csv
  end

  def remove_recipe(recipe_id) # Argument is index of the recipe from @recipes
    @recipes.delete_at(recipe_id)
    store_to_csv
  end

  def store_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def all
    @recipes #array that contains all the recipes
  end

end
