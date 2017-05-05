require 'rails_helper'

RSpec.feature "Admin log in", type: :feature do
  let!(:admin){create(:user, email: 'admin@test.com', password: '12345678', password_confirmation: '12345678')}

  scenario 'Sign in' do
    visit root_path
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(current_path).to eq(servers_path)
    expect(page).to have_text('Welcome, you are now logged in')
  end

  scenario 'Log out' do
    visit root_path
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Logged out successfully')
  end
end
