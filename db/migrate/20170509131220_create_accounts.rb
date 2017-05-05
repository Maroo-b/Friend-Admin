class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :user
      t.string :password
      t.string :account_type

      t.timestamps
    end
  end
end
