require 'rails_helper'

describe 'Visitor can choose a trail', type: :feature do
  context 'when viewing a list of trails returned from a search' do
    scenario 'and sees the trail they want to avoid' do

      visit root_path

      select 'Colorado', from: :state
      click_on 'Search by State'

      expect(current_path).to eq(location_path)

      expect(page).to have_content "friends"
      expect(page).to have_content "Abrams"
      expect(page).to have_content "Big Canyon"
      expect(page).to have_content "Blue Mountain"

    end
  end
end
