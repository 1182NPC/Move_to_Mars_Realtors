class BookingsController < ApplicationController

  def new
    set_trip
    @booking = Booking.new
    @booking.user = current_user
    @booking.trip = @trip
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.trip = set_trip
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

end
