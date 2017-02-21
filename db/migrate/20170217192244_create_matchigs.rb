class CreateMatchigs < ActiveRecord::Migration[5.0]
  def change
    create_table :matchings do |t|
      t.text :requirements

      t.timestamps
    end
  end
end
