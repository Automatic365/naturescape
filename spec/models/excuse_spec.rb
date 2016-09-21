require 'rails_helper'

describe 'Excuse', type: :model do
  it 'has excuses' do
      excuse_list = Excuse.excuse_list

      expect(excuse_list.count).to eq(16)
    end
  end
