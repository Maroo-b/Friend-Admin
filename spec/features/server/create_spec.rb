require 'rails_helper'

RSpec.describe "Create server details", type: :feature do

  scenario 'create new', js: true do
    i_sign_in_as_admin
    visit new_server_path
    fill_in 'CPU', with: 'AMD Opteron™ Processor 6128 (4 processeur)'
    fill_in 'Virtual Drive', with: '30 GO'
    fill_in 'RAM', with: '2 GO'
    fill_in 'OS', with: 'Debian 8.4'
    fill_in 'OS Type', with: '64 bits'
    fill_in 'Softwares', with: 'VMWare, virtualenv, myadmin'
    fill_in 'internal IP', with: '10.0.2.5'
    fill_in 'external IP', with: '175.48.14.55'
    fill_in 'Connection type', with: 'System'
    fill_in 'User', with: 'John'
    fill_in 'Password', with: 'random_password'
    click_on 'Submit'

    expect(current_path).to eq(servers_path)
    expect(page).to have_text('Server details created successfully')


  end
end
