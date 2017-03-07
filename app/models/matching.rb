class Matching < ApplicationRecord
  has_many :meals_names

  has_many :matching_meals
  has_many :meals, through: matching_meals

  has_many :matching_restaurants
  has_many :restaurants, through: :matching_restaurants

  has_many :matching_users
  has_many :users, through: :matching_users
  has_and_belongs_to_many :matchings,
    classname: 'Matching',
    join_table: 'similar_matchings',
    association_foreign_key: 'similar_matching_id'
    
end
