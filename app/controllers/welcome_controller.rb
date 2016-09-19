class WelcomeController < ApplicationController

  def index
    look = Trail.all_hiking_locations
    # require "pry"; binding.pry
    trail_states = Trail.all_hiking_locations.map do |loc|
      loc.state
    end
    trail_states.delete("All")
    @trails = trail_states
  end

end
