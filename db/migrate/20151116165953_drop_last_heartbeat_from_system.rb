class DropLastHeartbeatFromSystem < ActiveRecord::Migration
  def change
    remove_column :systems, :last_heartbeat
  end
end
