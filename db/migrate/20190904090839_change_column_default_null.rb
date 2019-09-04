class ChangeColumnDefaultNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:carts, :paid, false)
    change_column_default(:carts, :paid, from: false, to: "draft")
  end
end
