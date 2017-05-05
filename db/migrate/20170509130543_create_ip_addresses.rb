class CreateIpAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :ip_addresses do |t|
      t.string :ip
      t.string :network_address
      t.string :gateway
      t.string :address_type

      t.timestamps
    end
  end
end
