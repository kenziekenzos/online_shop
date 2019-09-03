class DropOrderTable < ActiveRecord::Migration[5.2]
  def change
   drop_table :orders do |t|
     t.string :name, null: false
     t.string :email, null: false
     t.text :address, null: false
     t.timestamps null: false
   end
 end
end
