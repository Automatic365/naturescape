class TrailsController < ApplicationController

  def index
    @trails = Trail.formatted_locations_by_state(params[:state])
  end

end
