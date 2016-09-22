require 'rails_helper'

RSpec.describe AlternativeActivitiesController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index, params: { type: "bar", rankby: "distance", location: "38.5442636, -105.980537" }
      expect(response.status).to eq(200)
    end
  end
end
