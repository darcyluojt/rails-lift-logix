class Workout < ApplicationRecord
  belongs_to :split
  has_many :logs, dependent: :destroy
end
