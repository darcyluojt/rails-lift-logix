class Split < ApplicationRecord
  belongs_to :programme
  has_many :workouts, dependent: :destroy
  has_many :split_exercises, dependent: :destroy
  has_many :exercises, through: :split_exercises
end
