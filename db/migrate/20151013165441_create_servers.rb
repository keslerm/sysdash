class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :token
      t.string :ip
      t.timestamp :last_heartbeat

      t.timestamps null: false
    end
  end
end
