class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  after_create :create_empty_cart

  def create_empty_cart
    Cart.create(user_id: id, paid: false)
  end

  def cart
    Cart.find_or_create_by!(
      user_id: id,
      paid: false
    )
  end

  def checkout
    cart.update(paid: true)
  end
end
