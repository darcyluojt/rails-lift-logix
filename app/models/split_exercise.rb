class SplitExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :split
  has_many :logs, dependent: :destroy
  has_many :workouts, through: :logs
  validates :exercise_id, presence: true
end
