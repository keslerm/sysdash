class CreateHeartbeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|
      t.integer :server_id
      t.string :uptime
      t.float :cpu_usage

      t.timestamps null: false
    end
  end
end
