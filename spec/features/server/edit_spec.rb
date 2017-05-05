require 'rails_helper'

RSpec.describe "Create server details", type: :feature do

  scenario 'edit server details', js: true do
    server = create(:server)

    i_sign_in_as_admin
    visit edit_server_path(server.id)
    fill_in 'Name', with: 'server updated'
    click_on 'Update'

    expect(current_path).to eq(servers_path)
    expect(page).to have_text('Server details updated successfully')


  end
end
