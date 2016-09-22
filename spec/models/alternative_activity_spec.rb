require 'rails_helper'

describe 'Alternative Activity', type: :model do
  it 'finds desired activities in specified areas' do
    VCR.use_cassette('finds activity by type') do
      params = ({"type"=>"amusement_park", "location"=>"39.7512545, -105.003094",
                "rankby"=>"distance"})
      activities = AlternativeActivity.alternative_activity_search(params['location'], params['rankby'], params['type'])
      selected_activity_name    = activities.results.first.name
      selected_activity_address = activities.results.first.vicinity
      selected_activity_rating  = activities.results.first.rating

      expect(selected_activity_name).to eq("Elitch Gardens")
      expect(selected_activity_address).to eq("2000 Elitch Circle, Denver")
      expect(selected_activity_rating).to eq(3.6)
    end
  end
end
