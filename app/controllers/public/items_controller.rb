class Public::ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index]
  
  def new
    @item = Item.new
  end
  
  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def create
     item = Item.new(item_params)
     item.user = current_user
     item.save!
    redirect_to item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
    @user = current_user
  end
  
  def edit
     @item = Item.find(params[:id])
  end

  def update
     item = Item.find(params[:id])
     item.update(item_params)
     redirect_to item_path(item.id)
     
  end
  
   private
   
   def item_params
     params.require(:item).permit(:name,:introduction, :status, :price,:is_active, images: []) #画像を複数枚選択する記述
   end
end
