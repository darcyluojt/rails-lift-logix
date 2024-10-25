class Workout < ApplicationRecord
  belongs_to :split
  # belongs_to :programme, optional: true
  has_many :logs, dependent: :destroy
  has_many :split_exercises, through: :logs
  validates :date, presence: true
  validates :split, presence: true

  def start_time
    # set a default start time of each workout for the calendar view
    # this is used in the calendar view to display the workout start time
    date
  end
end
