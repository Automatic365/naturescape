class LocationsController < ApplicationController

  def show
    @location = Location.search(params[:q])
    require "pry"; binding.pry
  end

end
