class CreateAffairs < ActiveRecord::Migration[5.0]
  def change
    create_table :affairs do |t|
      t.integer :first_person_id
      t.integer :second_person_id
      t.string :state

      t.timestamps
    end
  end
end
