class CreateOpeningClosings < ActiveRecord::Migration[5.0]
  def change
    create_table :opening_closings do |t|
      t.integer :restaurant_id
      t.string :mo_opening
      t.string :mo_closing
      t.string :tu_opening
      t.string :tu_closing
      t.string :we_opening
      t.string :we_closing
      t.string :th_opening
      t.string :th_closing
      t.string :fr_opening
      t.string :fr_closing
      t.string :sa_opening
      t.string :sa_closing
      t.string :su_opening
      t.string :su_closing
      t.timestamps
    end
  end
end
