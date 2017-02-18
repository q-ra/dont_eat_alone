class CreateMatchigs < ActiveRecord::Migration[5.0]
  def change
    create_table :matchigs do |t|
      

      t.timestamps
    end
  end
end
