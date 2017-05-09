class AddServerRefToIpAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :ip_addresses, :server, foreign_key: true
  end
end
