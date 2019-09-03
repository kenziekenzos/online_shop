class Item < ApplicationRecord
  has_many :carts
  has_many :carts, through: :line_items
end
