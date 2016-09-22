require 'rails_helper'

describe AlternativeActivityService do
  context "#find_activities_by_type" do
    it "returns a list of locations that provide selected activity" do
      VCR.use_cassette("activity locations") do
        activity_locations = AlternativeActivityService.new("38.5442636, -105.980537", "distance", "bar").find_activities_by_type
        bars = activity_locations.results.map {|bar| bar.name}
        bar = bars.first

        expect(bars.count).to eq(15)
        expect(bar).to eq("Victoria Bar")
      end
    end
  end
end
