class RenameEventToMessage < ActiveRecord::Migration
  def change
    rename_table :events, :messages
  end
end
