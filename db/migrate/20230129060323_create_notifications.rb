class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :room_id
      t.integer :message_id
      t.integer :order_id, null: false
      t.string :action
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
