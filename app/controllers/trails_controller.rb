class TrailsController < ApplicationController

  def index
    @trails = Trail.hiking_locations_by_state(params[:q])
  end

end
