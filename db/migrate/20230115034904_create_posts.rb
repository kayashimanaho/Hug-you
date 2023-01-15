class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.string :public_flag, null: false
      
      t.timestamps
    end
  end
end
