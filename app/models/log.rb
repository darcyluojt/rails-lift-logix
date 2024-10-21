class Log < ApplicationRecord
  belongs_to :workout
  belongs_to :split_exercise
  validates :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :repetitions, numericality: { greater_than: 0 }, presence: true
end
