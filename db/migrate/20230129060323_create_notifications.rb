class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id #通知するユーザー
      t.integer :visited_id #通知を受けるユーザ
      t.integer :room_id
      t.integer :message_id
      t.integer :order_id
      t.string :action
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
