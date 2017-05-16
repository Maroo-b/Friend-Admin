require 'rails_helper'

RSpec.describe "Create server details", type: :feature do

  scenario 'create new', js: true do
    i_sign_in_as_admin
    visit new_server_path
    fill_in 'Name', with: 'server 1'
    fill_in 'CPU', with: 'AMD Opteron™ Processor 6128 (4 processeur)'
    fill_in 'Drive', with: '30 GO'
    fill_in 'RAM', with: '2 GO'
    fill_in 'OS', with: 'Debian 8.4'
    fill_in 'OS Type', with: '64 bits'
    fill_in 'Installed Applications', with: 'VMWare, virtualenv, myadmin'
    fill_in 'IP address', with: '10.0.2.5'
    fill_in 'Network mask', with: '255.255.255.0'
    fill_in 'Network address', with: '10.0.2.0'
    fill_in 'Gateway', with: '175.48.14.55'
    select 'internal', from: 'ip_addresses_data__address_type'
    fill_in 'Account type', with: 'System'
    fill_in 'User', with: 'John'
    fill_in 'Password', with: 'random_password'
    click_on 'Create'

    expect(current_path).to eq(servers_path)
    expect(page).to have_text('Server details created successfully')


  end
end
