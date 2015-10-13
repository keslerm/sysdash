class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :token
      t.string :name
      t.string :ip
      t.timestamp :last_checkin

      t.timestamps null: false
    end
  end
end
