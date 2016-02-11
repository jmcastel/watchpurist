class AddContactUsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :contact_us, :bool
  end
end
