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
      redirect_to cart_items_path
    end
  end

  def destroy_all
    current_user.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    # ログインしているユーザの持っているカート内商品の中に今カートに入れようとしたitemのidを持ったカート商品があるかを確認なければ保存する
    unless current_user.cart_items.exists?(item_id: params[:cart_item][:item_id])
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.user_id = current_user.id

  		if @cart_item.save
  		  redirect_to cart_items_path
  		else
        render
  		end
  	else
		  redirect_to cart_items_path
	  end
  end


private

def cart_item_params
     params.require(:cart_item).permit(:item_id, :user_id)
end
end
