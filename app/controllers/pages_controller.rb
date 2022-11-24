
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_results

  def home

  end

 private

  def set_results
    @results
  end


end
