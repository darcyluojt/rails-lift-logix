class SplitExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :split
  has_many :logs

  validates :exercise_id, presence: true
end
