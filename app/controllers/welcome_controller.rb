class WelcomeController < ApplicationController

  def index
    @trails = Trail.all_hiking_locations.take(10)
  end

end
