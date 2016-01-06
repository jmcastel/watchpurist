class AddEmailToPrivateMessages < ActiveRecord::Migration
  def change
    add_column :private_messages, :poster_email, :string
  end
end
