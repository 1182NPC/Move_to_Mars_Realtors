class BookingsController < ApplicationController


  def new
    set_trip
    @booking = Booking.new
    @booking.user = current_user
    @booking.trip = @trip
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pending!
    @booking.trip = set_trip
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
   def index
    @bookings = Booking.where(user_id: current_user)
  end

  def host_index
    @bookings = Booking.all
  end
  
  def update
    @booking = Booking.find(params[:id])
    method = params[:action]
    @booking.public_send(method)
  end

  # a user will sendn a "params[:action]" when they click on either the accept or the reject button
  # The route of the button will tell us which method to call
  # The method ALREADY EXISTS thanks to enum - those being the accepted! and rejected! methods
  # for further reference see: https://api.rubyonrails.org/v5.1/classes/ActiveRecord/Enum.html

  # accept Button /bookmars/1?action=accepted!
  # reject Button /bookmars/1?action=rejected!

  # def accept
  #   @booking = Booking.find(params[:id])
  #   @booking.accepted!
  #   redirect_to @booking.trip
  # end

  # def rejected
  #   @booking = Booking.find(params[:id])
  #   @booking.rejected!
  #   redirect_to @booking.trip
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end


end
