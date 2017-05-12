require 'rails_helper'

RSpec.describe 'Server index', type: :feature do

  it 'display table for existing Servers' do
    server = create(:server, name: "My Server")
    i_sign_in_as_admin

    visit servers_path
    expect(page).to have_content('My Server')
  end
end
