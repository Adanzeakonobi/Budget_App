require 'rails_helper'

RSpec.describe 'Visit splashpage', type: :feature do
  scenario 'Splash screen buttons LOG IN' do
    visit root_path
    expect(page).to have_content('LOG IN')
  end

  scenario 'Splash screen buttons SIGN UP' do
    visit root_path
    expect(page).to have_content('SIGN UP')
  end

  scenario 'Splash screen has' do
    visit root_path
    expect(page).to have_content('Transactions App')
  end
end
