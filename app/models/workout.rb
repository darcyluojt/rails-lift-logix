class Workout < ApplicationRecord
  belongs_to :split
  belongs_to :programme, optional: true
  has_many :logs, dependent: :destroy
  has_many :split_exercises, through: :logs
end
