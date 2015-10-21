class AddPasswordDigestRemovePasswordAndSaltFromUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :password
    remove_column :users, :salt
  end
end
