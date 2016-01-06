class AddPostTitleToPrivateMessages < ActiveRecord::Migration
  def change
    add_column :private_messages, :post_title, :string
  end
end
