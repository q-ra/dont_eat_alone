class CreateMatchingMealsAndRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :matching_restaurants do |t|
      t.integer :restaurant_id
      t.integer :matching_id
      t.timestamps
    end

    create_table :matching_meals_names do |t|
      t.integer :matching_id
      t.string :meal_name
    end

    create_table :matching_meals do |t|
      t.integer :matching_id
      t.integer :meal_id
    end
  end
end
