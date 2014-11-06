class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :measurements
end
