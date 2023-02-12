class Public::CartItemsController < ApplicationController
 def index
    @total = 0
    @cart_items = current_user.cart_items
 end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
     redirect_to cart_items_path
  end

  def destroy
     @cart_item = CartItem.find(params[:id])
    if @cart_item.user_id == current_user.id
      @cart_item.destroy
    end
  end

  def destroy_all
    current_user.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id

		if @cart_item.save
		  redirect_to cart_items_path
		else
      render
		end
  end


private

def cart_item_params
     params.require(:cart_item).permit(:item_id, :user_id)
end
end
