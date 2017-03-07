class CreateMatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :matchings do |t|
      t.string :sex
      t.float :longitute
      t.float :latitute
      t.boolean :searchable, default: true
      t.integer :max_distance_from_point
      t.timestamps
    end
  end
end
