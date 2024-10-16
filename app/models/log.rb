class Log < ApplicationRecord
  belongs_to :workout
  belongs_to :split_exercise, dependent: :destroy
end
