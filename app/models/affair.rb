class Affair < ApplicationRecord
  belongs_to :user, foreign_key: 'first_person_id', class_name: 'User'
  belongs_to :second_user, foreign_key: 'second_person_id', class_name: 'User'
end
