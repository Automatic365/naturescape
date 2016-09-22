require 'rails_helper'

RSpec.feature 'Guest login with google oauth' do
  scenario 'while on home page guest clicks login with google' do
    setup_for_oauth
    VCR.use_cassette('google oauth') do


      visit '/'

      expect(page).to have_content("Welcome to NaturEscape")
      expect(page).to have_content("Where are you trying to escape from?")
      expect(page).to have_link("Login")

      click_on "Login"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Bobby")
    end
  end
end
