class LocationsController < ApplicationController

  def show
    if params[:q].empty?
      @location = Location.search_by_current_location
    else
      @location = Location.search_by_input_location(params[:q])
    end
  end

end

# class LocationPresenter
#   def self.search(params)
#     if params == #to a zip
#      @location = Location.search(params)
#      @location.parse_for_zip
#    else
#      @location = Location.search(params)
#      @location.parse_for_address
#    end
#  end
# end
