class AddReadAtToPrivateMessages < ActiveRecord::Migration
  def change
    add_column :private_messages, :read_at, :datetime
  end
end
