require 'rails_helper'

describe 'User can log out', type: :feature do
  scenario 'user logs out and sees the root page' do
    setup_for_oauth
    VCR.use_cassette('google logout') do

      visit root_path

      click_link 'Login'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Bobby")
      expect(page).not_to have_content 'Login'

      click_on 'Log Out'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Login'
    end
  end
end
