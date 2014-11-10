class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients

  def categories
    ingredients.collect { |ingredient| ingredient.category }
  end
end
