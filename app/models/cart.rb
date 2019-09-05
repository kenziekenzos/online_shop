class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  before_validation :check_for_other_empty_carts

  def check_for_other_empty_carts
    user = User.find(user_id)
    return if user.carts.where(paid: false).blank?

    errors.add(:cart, "L'utilisateur dispose déjà d'un panier")
  end

  def add_product(item)
     current_item = line_items.find_by(item_id: item.id)
     if !current_item
       current_item = line_items.create(item_id: item.id)
     else
       # put a flash message to say that this item is already in the cart
     end
     current_item
  end

  def total_price
    sum = 0
    self.line_items.each_with_index do |line_item, i|
        sum += line_item.item.price
    end
    sum
  end
end
