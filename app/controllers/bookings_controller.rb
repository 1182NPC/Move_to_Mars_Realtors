class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def host_index
    @bookings = Booking.all
  end
end
