class LocationsController < ApplicationController

  def show
    if params[:trail]
      @location = Search.search_by_input_location(params[:trail], params[:state])
    else
      @location = Search.search_by_current_location
      # require "pry"; binding.pry
    end
  end

end
