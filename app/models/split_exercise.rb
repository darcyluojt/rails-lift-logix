class SplitExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :split
  has_many :logs, dependent: :destroy

  validates :exercise_id, presence: true
end
