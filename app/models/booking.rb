class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :user, through: :trips
  belongs_to :trip
  enum status: [ :accepted, :pending, :rejected ]
end
