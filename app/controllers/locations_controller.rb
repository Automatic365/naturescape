class LocationsController < ApplicationController

  def show
    if params[:q].empty?
      @location = Search.search_by_current_location
    else
      @location = Search.search_by_input_location(params[:q])
      # require "pry"; binding.pry
    end
  end

end
