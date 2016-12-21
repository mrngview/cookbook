class View

  def list_all(recipes) # Array of recipe objects
    counter = 1
    recipes.each do |recipe|
      puts "#{counter}- #{recipe.name} #{recipe.description}"
      counter += 1
    end
  end

  def add
    puts "Insert name: "
    name = gets.chomp
    puts "insert description: "
    description = gets.chomp
    return [name, description]
  end

  def remove
    puts "Remove recipe nº: "
    num = gets.chomp.to_i
    return num - 1 #Will be the index of the recipe we want to remove
  end

  def congrats
    puts "Your recipe has been added!"
  end

  def failures
    puts "Failure. Please retry!"
  end

  def removed_message
    puts "The recipe has been removed!"
  end

  def ask_ingredient
    puts "Type an ingredient: "
    return gets.chomp
  end

  def print_result(ingredient, recipes_array)
    counter = 1
    puts "Looking for \"#{ingredient.upcase}\" on Marmiton..."
    sleep 2
    puts "#{recipes_array.size} results found!"
    puts ""
    recipes_array.each do |recipe|
      puts "#{counter}- #{recipe.name}
                        Preparation time: #{recipe.time}"
      counter += 1
    end
  end

  def select_to_import
    puts "Please type a number to choose which recipe to import: "
    num = gets.chomp.to_i
    return num -1
  end
end
