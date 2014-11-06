class MakeMeasurementsJoinTable < ActiveRecord::Migration
  def change
    add_column :measurements, :recipe_id, :integer
    add_column :measurements, :ingredient_id, :integer
  end
end
