class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false
      t.integer :receive_user_id, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
