class AddPseudoToPrivateMessages < ActiveRecord::Migration
  def change
    add_column :private_messages, :pseudo, :string
  end
end
