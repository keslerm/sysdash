class RenameServerToSystem < ActiveRecord::Migration
  def change
    rename_column :heartbeats, :server_id, :system_id
    rename_column :messages, :server_id, :system_id
    rename_table :servers, :systems
  end
end
