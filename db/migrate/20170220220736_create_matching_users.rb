class CreateMatchingUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :matching_users do |t|
      t.integer :user_id
      t.integer :matching_id

      t.timestamps
    end
  end
end
