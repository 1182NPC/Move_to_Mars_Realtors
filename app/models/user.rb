class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :trips, through: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  has_one_attached :avatar, dependent: :destroy
end
