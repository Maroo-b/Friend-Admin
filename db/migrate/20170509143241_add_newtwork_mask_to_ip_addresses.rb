class AddNewtworkMaskToIpAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :ip_addresses, :network_mask, :string
  end
end
