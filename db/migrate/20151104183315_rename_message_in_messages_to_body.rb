class RenameMessageInMessagesToBody < ActiveRecord::Migration
  def change
    rename_column :messages, :message, :body
  end
end
