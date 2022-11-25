require 'open-uri'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # image
    @results = ["","",""]
  end

  # def image
  #   @results = []
  #   5.times do
  #     @results << serialize["photos"].sample["img_src"]
  #   end
  # end


  # def serialize
  #   url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2022-11-1&api_key=QlznhKndy19hbfAVKWeMFeC6wKc5Sec0fUz34g0T"
  #   attempt_serialized = URI.open(url).read
  #     JSON.parse(attempt_serialized)
  # end

end
