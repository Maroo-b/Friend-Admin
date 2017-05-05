class AddServerRefToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_reference :accounts, :server, foreign_key: true
  end
end
