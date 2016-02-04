class ChangeAddressUser < ActiveRecord::Migration
  def change
  	change_column :users, :address, :text
  end
end
