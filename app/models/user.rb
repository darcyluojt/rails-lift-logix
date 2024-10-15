class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :programmes, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :date_of_birth, presence: true
end
