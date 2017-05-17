class AddIvToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :iv, :string
  end
end
