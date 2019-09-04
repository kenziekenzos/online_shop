class LineItemsController < ApplicationController
    before_action :set_line_item, only: [:show, :edit, :update, :destroy]

    def index
      @line_items = LineItem.all
    end

    def show
      @line_items = LineItem.all
    end

    def create
      @cart.items << item
    end

  private
    def set_line_item
      @item = Lineitem.find(params[:id])
    end

    def item_params
      params.require(:lineItem).permit(:user_id, :cart_id)
    end

end
