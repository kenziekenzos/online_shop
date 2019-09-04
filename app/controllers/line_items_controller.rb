class LineItemsController < ApplicationController
    before_action :set_line_item, only: [:show, :edit, :update, :destroy]

    # def show
    #   @line_items = LineItem.all
    # end
    def create
        if !user_signed_in?
          redirect_to new_user_registration_path
        else
          item = Item.find(params[:id])
          @cart.add_product(item)
          if @cart.save
            redirect_to cart_path(@cart)
          end
        end
      end
      def destroy
        LineItem.find(params[:id]).destroy
        redirect_to cart_path(@cart)
      end

  private
    def set_line_item
      @item = LineItem.find(params[:id])
    end

    def item_params
      params.require(:line_Item).permit(:user_id, :cart_id)
    end

end
