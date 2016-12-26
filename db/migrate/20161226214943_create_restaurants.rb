class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :pyszne_address
      t.string :picture_address
      t.string :meal_type
      t.string :city
      t.string :street
      t.string :zip_code
      t.string :website
      t.string :category
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
