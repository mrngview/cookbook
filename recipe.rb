# MODEL

class Recipe
  attr_accessor :name, :description, :time
  def initialize(name, description)
    @name = name
    @description = description
    @time = nil
  end
end
