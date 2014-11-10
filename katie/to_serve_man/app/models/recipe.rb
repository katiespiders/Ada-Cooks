class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients

  def categories
    hash = {}
    ingredients.each do |ingredient|
      if hash[ingredient.category]
        hash[ingredient.category] << ingredient.name
      else
        hash[ingredient.category] = [ingredient.name]
      end
    end
    hash
  end

  def add(ingredient)
    ingredients << ingredient
  end

end
