class AddDetailsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :year, :string
    add_column :posts, :condition, :string
    add_column :posts, :location, :string
    add_column :posts, :shipping, :string
    add_column :posts, :movement, :string
    add_column :posts, :case, :string
    add_column :posts, :bracelet, :string
    add_column :posts, :dial, :string
    add_column :posts, :functions, :text
    add_column :posts, :availability, :string
  end
end
