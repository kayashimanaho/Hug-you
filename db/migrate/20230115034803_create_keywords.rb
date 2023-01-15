class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :keyword, null: false
      t.integer :keyword_time, null: false
      t.timestamps
    end
  end
end
