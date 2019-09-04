class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_product(item)
     current_item = line_items.find_by(item_id: item.id)
     if !current_item
       current_item = line_items.create(item_id: item.id)
     else
       # put a flash message to say that this item is already in the cart
     end
     current_item
  end
end
