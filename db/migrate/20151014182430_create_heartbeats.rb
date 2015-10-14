class CreateHeartbeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|
      t.integer :server_id
      t.string :uptime
      t.float :cpu_usage
      t.integer :mem_total
      t.integer :mem_free

      t.timestamps null: false
    end

    add_index :heartbeats, :server_id
  end
end
