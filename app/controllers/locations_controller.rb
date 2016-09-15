class LocationsController < ApplicationController

  def show
    @location = Location.search(params[:q])
    # @location = LocationPresenter.search(params[:q])
    # require "pry"; binding.pry
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
