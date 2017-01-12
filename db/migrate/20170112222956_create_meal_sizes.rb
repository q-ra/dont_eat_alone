class CreateMealSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_sizes do |t|
      t.string :name
      t.integer :cost
      t.integer :meal_id

      t.timestamps
    end
  end
end
