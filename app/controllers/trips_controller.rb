class TripsController < ApplicationController
  before_action :set_trip, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @trips = Trip.all
  end

  def show
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path, status: :see_other
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :price, :description, photos: [])
  end
end
