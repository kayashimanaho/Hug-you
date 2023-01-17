class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
     redirect_to admin_user_path(@user.id)
  end
  
  private
   
  def user_params
    params.require(:user).permit(:email, :reset_password_token, :reset_password_sent_at, :remember_created_at,:name, :postal_code, :address, :nick_name, :age, :from, :profile_image, :introduction, :is_deleted)
  end
end
