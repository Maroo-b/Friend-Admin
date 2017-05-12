class AlterAddressTypeForIpAddresses < ActiveRecord::Migration[5.1]
  def change
    change_column :ip_addresses, :address_type, 'integer USING CAST(address_type AS integer)'
  end
end
