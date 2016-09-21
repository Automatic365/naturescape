require 'rails_helper'

describe 'Search', type: :model do
  it 'searches by input location' do
    VCR.use_cassette('finds location by trail area') do
      params = ({"state"=>"Colorado", "trail"=>"Big Canyon"})
      location = Search.search_by_input_location(params['trail'], params['state'])
      area  = location.results.first.address_components.second.long_name

      expect(area).to eq("Rio Blanco County")
    end
  end

  it 'searches by current' do
    VCR.use_cassette('finds by geolocation') do
      location = Search.search_by_current_location
      area  = location.results.first.address_components.second.long_name

      expect(area).to eq("Wewatta Street")
    end
  end
end
