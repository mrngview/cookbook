# MODEL

class Recipe
  attr_accessor :name, :description, :time
  def initialize(name, description, time)
    @name = name
    @description = description
    @time = time
  end
end
