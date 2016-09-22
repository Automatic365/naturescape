require 'rails_helper'

describe 'Visitor can choose a trail', type: :feature do
  context 'when viewing a list of trails returned from a search' do
    scenario 'and sees the trail they want to avoid' do

      visit root_path

      select 'Colorado', from: :location
      select 'October', from: :date
      select '10 miles', from: :radius
      click_on 'Submit'

      expect(current_path).to eq(festivals_path)

      expect(page).to have_content "Pumpkin Festival"
      expect(page).to have_content "Littleton"
      expect(page).to have_content "Colorado"
      expect(page).to have_content "8500 Deer Creek Canyon Rd"
      expect(page).to have_link    "View details and find campgrounds"

      first('.Pumpkin').click_link('View details and find campgrounds')

      expect(page).to have_content "Pumpkin Festival"
      expect(page).to have_content "Denver"
      expect(page).to have_content "Colorado"
      expect(page).to have_content "1007 York Street"
    end
  end
end
