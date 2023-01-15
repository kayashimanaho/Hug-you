class CreatePostKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :post_keywords do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
