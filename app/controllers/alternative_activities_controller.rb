class AlternativeActivitiesController < ApplicationController

  def index
    @alt_activities = AlternativeActivity.alternative_activity_search(params[:lat],
                                  params[:lng], params[:alternative])
  end
end
