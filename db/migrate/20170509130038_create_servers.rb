class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :cpu
      t.string :drive
      t.string :ram
      t.string :os
      t.string :os_type
      t.string :applications

      t.timestamps
    end
  end
end
