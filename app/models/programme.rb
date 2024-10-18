class Programme < ApplicationRecord
  belongs_to :user
  has_many :splits, dependent: :destroy, inverse_of: :programme
  has_many :workouts, through: :splits
  accepts_nested_attributes_for :splits, allow_destroy: true
end
