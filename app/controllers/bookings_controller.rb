class BookingsController < ApplicationController

  # Default status of the booking needs to be pending in the create method !!!! IMPROTANT



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



end
