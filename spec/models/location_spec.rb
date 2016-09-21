# require 'rails_helper'
#
# describe 'Location', type: :model do
#   it 'searches by input location' do
#     VCR.use_cassette('finds location by trail area') do
#       params = ({"state"=>"Colorado", "trail"=>"Big Canyon"})
#       location = Search.search_by_input_location(params['trail'], params['state'])
#       area  = location.results.first.address_components.second.long_name
#
#       expect(area).to eq("Rio Blanco County")
#     end
#   end
