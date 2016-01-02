class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.string :title
      t.text :content
      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
