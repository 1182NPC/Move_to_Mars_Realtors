require 'open-uri'
require 'json'
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :image

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  def image
    @results = []
    5.times do
      @results << serialize["photos"].sample["img_src"]
    end
  end

  def serialize
    url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2022-11-1&api_key=DEMO_KEY"
    attempt_serialized = URI.open(url).read
    JSON.parse(attempt_serialized)
  end

end
