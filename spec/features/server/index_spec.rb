require 'rails_helper'

RSpec.describe 'Server index', type: :feature do

  it 'display table for existing Servers' do
    server = create(:server, name: "My Server")
    i_sign_in_as_admin

    visit servers_path
    expect(page).to have_content('My Server')
  end

  it 'display paginated servers', js: true do
    create(:server, name: "Server_1")
    create(:server, name: "Server_2")
    allow(Server).to receive(:default_per_page).and_return(1)
    i_sign_in_as_admin
    visit servers_path

    expect(page).not_to have_content('Server_2')
    find('i', text: 'chevron_right').click
    expect(page).to have_content('Server_2')

  end
end
