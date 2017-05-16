require 'rails_helper'

RSpec.describe "Show Server", type: :feature do
  it 'display server information' do
    server = create(:server, name: "My Server")
    i_sign_in_as_admin

    visit server_path(server)

    expect(page).to have_content("My Server")
  end
end
