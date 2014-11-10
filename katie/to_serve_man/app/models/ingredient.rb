class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes

  def self.categories
    %w[Meat Produce Grains Spices Other]
  end

end
