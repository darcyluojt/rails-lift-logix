class Exercise < ApplicationRecord
  has_many :split_exercises, -> { includes :log }
  has_many :splits, through: :split_exercises
  has_many :logs, through: :split_exercises

end
