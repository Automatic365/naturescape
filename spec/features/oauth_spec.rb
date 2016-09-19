require 'rails_helper'

RSpec.feature 'Guest login with google oauth' do
  scenario 'while on home page guest clicks login with google' do
    setup_for_oauth

    visit '/'

    expect(page).to have_content("Welcome to NaturEscape")
    expect(page).to have_content("Select a place to avoid")
    expect(page).to have_link("Login")

    click_on "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Bobby")
  end
end
