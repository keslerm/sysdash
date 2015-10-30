class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :server_id
      t.string :message
      t.string :status

      t.timestamps null: false
    end
  end
end
