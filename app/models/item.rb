class Item < ApplicationRecord
  has_many :line_items
  has_many :carts, through: :line_items
end
