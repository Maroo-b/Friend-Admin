class AlterIvTypeForAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :iv, :string
    add_column :accounts, :iv, :binary
  end
end
