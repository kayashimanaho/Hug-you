class Public::UsersController < ApplicationController
  def my_page
    @user = current_user
    @users = User.all
    
  end

  def show
    @user = current_user
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
