class Programme < ApplicationRecord
  belongs_to :user
  has_many :splits, dependent: :destroy
end
