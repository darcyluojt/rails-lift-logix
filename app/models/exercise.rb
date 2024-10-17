class Exercise < ApplicationRecord
  has_many :split_exercises, dependent: :destroy
  has_many :logs, through: :split_exercises

end
