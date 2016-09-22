require 'rails_helper'

describe 'Trails', type: :model do
  it 'finds all trails by state' do
    VCR.use_cassette('trails formatted_locations_by_state') do
      params = {"state"=>"Colorado"}
      trails = Trail.formatted_locations_by_state(params['state'])
      selected_trail  = trails.sort.first

      expect(selected_trail).to eq(["Abrams / Worlds Greatest", "Eagle"])
    end
  end
end
