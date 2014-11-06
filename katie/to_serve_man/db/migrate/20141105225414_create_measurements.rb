class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
