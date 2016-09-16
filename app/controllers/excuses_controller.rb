class ExcusesController < ApplicationController

  def index
    @excuses = Excuse.excuse_list
  end

end
