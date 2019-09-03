class Cart < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :items, through: :line_items
end
