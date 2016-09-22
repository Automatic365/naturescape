require 'rails_helper'

describe TrailService do
  context "#all_hiking_locations" do
    it "returns a list of all trails" do
      VCR.use_cassette("trails") do
        trail_info = TrailService.new.all_hiking_locations
        trails = trail_info.places.map {|trail| trail.name}
        trail = trails.first

        expect(trails.count).to eq(100)
        expect(trail).to eq("Steliko Ridge Trail #1454")
      end
    end

    context "#hiking_locations_by_state" do
      it "returns trails for given state" do
        VCR.use_cassette("trails by state") do
          trail_info = TrailService.new.hiking_locations_by_state("Colorado")
          trails = trail_info.places.map {|trail| trail.name}
          trail = trails.first

          expect(trails.count).to eq(100)
          expect(trail).to eq("Frontside")
        end
      end
    end
  end
end
