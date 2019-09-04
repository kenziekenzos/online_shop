class LineItemsController < ApplicationController
    before_action :set_line_item, only: [:show, :edit, :update, :destroy]

    # def show
    #   @line_items = LineItem.all
    # end

    def create
  # Find associated item and current cart
      @line_items = LineItem.create(item_id: params[:item_id], cart_id: current_user.current_cart.id)
      current_cart << @line_item.items
      # redirect_to cart_path(current_cart)
    end

  private
    def set_line_item
      @item = LineItem.find(params[:id])
    end

    def item_params
      params.require(:line_Item).permit(:user_id, :cart_id)
    end

end
