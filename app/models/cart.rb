class Cart < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
end
