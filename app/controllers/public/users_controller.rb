class Public::UsersController < ApplicationController
  def my_page
    @user = current_user
    @users = User.order(created_at: :desc)
    @posts = @user.posts.order(created_at: :desc)
    @comments = Comment.all
    @items = current_user.items
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @items = @user.items.order(created_at: :desc)
    # ログインしてるユーザーとメッセージ相手のユーザー情報をEntryテーブルから検索
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id #ログインしていないユーザー
      @current_entry.each do |current| #テーブルが存在するか調べる
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room #ルームがない時は作る
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  
  def edit
   @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
     redirect_to my_page_users_path(@user.id)
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    sign_out current_user
    redirect_to root_path
  end
  
   private
  
   def user_params
    params.require(:user).permit(:email, :reset_password_token, :reset_password_sent_at, :remember_created_at,:name, :postal_code, :address, :nick_name, :age, :from, :profile_image, :introduction, :is_deleted)
   end
  
end
