class ApplicationController < ActionController::Base
  def current_cart
  current_user.cart = @cart
  end
end
