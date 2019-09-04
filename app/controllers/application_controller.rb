class ApplicationController < ActionController::Base
	before_action :set_cart

  def set_cart
    return unless current_user.present?

    @cart = current_user.cart
	end
end
