class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :ingredients
end
