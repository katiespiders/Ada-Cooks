class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings
      t.string :author
      t.text :steps

      t.timestamps
    end
  end
end
