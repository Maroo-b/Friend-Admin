class AlterPasswordTypeForAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :password, :string
    add_column :accounts, :password, :binary
  end
end
