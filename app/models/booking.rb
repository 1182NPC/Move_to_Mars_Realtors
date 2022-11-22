class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  enum status: [ :accepted, :pending, :rejected ]
end
