class AddEmailToPrivateMessage < ActiveRecord::Migration
  def change
    add_column :private_messages, :email, :string
    add_column :private_messages, :from_user, :integer
  end
end
