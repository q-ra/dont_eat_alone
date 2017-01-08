class Restaurant < ApplicationRecord
  has_one :opening_closing
  has_many :user_restaurans
  has_many :users, through: user: :restaurants
end
