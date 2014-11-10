class ChangeMeasurementToJoinTable < ActiveRecord::Migration
  def change
    remove_column :measurements, :id
    remove_column :measurements, :quantity
    remove_column :measurements, :unit
    rename_table :measurements, :ingredients_recipes
  end
end
