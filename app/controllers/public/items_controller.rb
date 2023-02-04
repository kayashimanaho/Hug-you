class Public::ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index]
  
  def new
    @item = Item.new
  end
  
  def index
    @items = Item.all.page(params[:page]).per(8)
  end
  
  def create
     item = Item.new(item_params)
     item.save!
    redirect_to item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def edit
     @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
     @item.update(item_params)
     redirect_to item_path(@item.id)
     
  end
  
   private
   
   def item_params
     params.require(:item).permit(:image, :name,:introduction,:price,:is_active)
   end
end
