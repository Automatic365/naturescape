class WelcomeController < ApplicationController

  def index
    @trails = Trail.all_hiking_locations
  end

end
