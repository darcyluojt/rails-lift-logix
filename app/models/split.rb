class Split < ApplicationRecord
  belongs_to :programme, -> { includes :user }
  has_many :workouts, dependent: :destroy
  has_many :split_exercises, dependent: :destroy
  has_many :exercises, through: :split_exercises
  accepts_nested_attributes_for :split_exercises, allow_destroy: true
  validates :category, inclusion: { in: ['Upperbody', 'Lowerbody', 'Push', 'Pull', 'Legs', 'Fullbody'], allow_nil: false }
end
