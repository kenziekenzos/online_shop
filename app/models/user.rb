class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart
  after_create :create_cart

  def create_cart
    Cart.create(user_id: self.id)
  end

  def current_cart
   Cart.find_by(user_id: self.id, paid: false)
 end

 def checkout
   current_cart.update(paid: true)
   create_cart
 end

end
