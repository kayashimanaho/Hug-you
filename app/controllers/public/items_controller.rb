class Public::ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    # @cart_item = CartItem.new
     item = Item.new(item_params)
     item.user = current_user
     item.save
    redirect_to item_path(item.id), notice: '出品しました'
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    #  ログインしている人が投稿したアイテムの中から指定のidのものを返す
     @item = Item.find(params[:id])
    # 他人の商品を編集できないようにする記述
     unless @item.user == current_user
      redirect_to posts_path, notice: '他人の商品は編集できません'
     end
  end

  def update
     item = Item.find(params[:id])
     item.update(item_params)
     redirect_to item_path(item.id)

  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: '商品が削除されました'
  end

   private

   def item_params
     params.require(:item).permit(:name,:introduction, :status, :price,:is_active, images: []) #画像を複数枚選択する記述
   end
end
