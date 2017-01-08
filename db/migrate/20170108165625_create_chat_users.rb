class CreateChatUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_users do |t|
      t.string :state
      t.integer :user_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
