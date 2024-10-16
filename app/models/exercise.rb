class Exercise < ApplicationRecord
  has_many :split_exercises, dependent: :destroy

end
