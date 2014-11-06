class AddRatingsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :difficulty, :integer
    add_column :recipes, :goodness, :integer
  end
end
