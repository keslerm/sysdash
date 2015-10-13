class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :ip
      t.string :password
      t.timestamp :last_checkin

      t.timestamps null: false
    end
  end
end
