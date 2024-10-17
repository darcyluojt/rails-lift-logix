class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :programmes, dependent: :destroy
  has_many :splits, through: :programmes
  validates :username, presence: true, uniqueness: true
  validates :date_of_birth, presence: true, inclusion: { in: Date.new(1900)..Date.new(Date.today.year - 18), message: "must be 18 years or older" }
end
