class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :affairs, foreign_key: 'first_person_id', class_name: 'Affair'
  has_many :users, through: :affairs
  has_many :chat_users
  has_many :chats, through: :chat_users
  has_many :user_restaurans
  has_many :restaurants, through: :user_restaurans
end
