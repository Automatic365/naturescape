require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  describe "GET show when no params are present" do
    it "has a 200 status code" do
      get :show
      expect(response.status).to eq(200)
    end
  end

  describe "GET show when params are present" do
    it "has a 200 status code" do
      get :show, params: { trail: "Blue Mountain" }
      expect(response.status).to eq(200)
    end
  end
end
