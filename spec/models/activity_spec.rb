require 'rails_helper'

describe 'Activity', type: :model do
  it 'has activities' do
      activity_list = Activity.activities

      expect(activity_list.count).to eq(30)
    end
  end
