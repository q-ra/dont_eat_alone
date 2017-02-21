class CreateSimilarMatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :similar_matchings do |t|
      t.integer :similar_matching_id
      t.integer :matching_id
    end
  end
end
