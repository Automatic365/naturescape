class AlternativeActivitiesController < ApplicationController

  def index
    @alt_activities = AlternativeActivity.alternative_activity_search(params[:location], params[:rankby], params[:type])
  end
end
