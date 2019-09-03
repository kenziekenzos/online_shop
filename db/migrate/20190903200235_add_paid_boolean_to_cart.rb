class AddPaidBooleanToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :paid, :boolean
  end
end
