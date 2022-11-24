require 'open-uri'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    image
  end

  def image
    @results = []
    5.times do
      @results << serialize["photos"].sample["img_src"]
    end
  end

  def serialize
    url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2022-11-1&api_key=MzMSisiZMgsp8ZMzti6SLT3dgCtCNOUp2IjD1U0B"
    attempt_serialized = URI.open(url).read
      JSON.parse(attempt_serialized)
  end
end
