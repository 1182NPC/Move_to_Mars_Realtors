class TripsController < ApplicationController

  def new
    @list = List.new
  end

end
