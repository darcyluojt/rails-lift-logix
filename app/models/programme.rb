class Programme < ApplicationRecord
  belongs_to :user
  has_many :splits, dependent: :destroy, inverse_of: :programme
  has_many :workouts, through: :splits
  accepts_nested_attributes_for :splits, allow_destroy: true
  validates :splits_per_week, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :weeks, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
