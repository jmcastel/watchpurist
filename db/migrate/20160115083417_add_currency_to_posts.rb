class AddCurrencyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :currency, :string
  end
end
