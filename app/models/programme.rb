class Programme < ApplicationRecord
  belongs_to :user
  has_many :splits, dependent: :destroy
  accepts_nested_attributes_for :splits, allow_destroy: true
end
