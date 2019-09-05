class ApplicationController < ActionController::Base
  before_action :set_cart

  def set_cart
    @cart = current_user.cart
  end

end
