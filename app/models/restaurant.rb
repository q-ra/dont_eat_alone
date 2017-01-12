class Restaurant < ApplicationRecord
  has_one :opening_closing
  has_many :user_restaurans
  has_many :users, through: :user_restaurants
  has_many :meals

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
