class Public::PostsController < ApplicationController
   before_action :authenticate_user!, only: [:show, :create]
  def index
    # @posts = Post.find(params[:id])
    @posts = Post.all
    @post = Post.new
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が成功しました."
       redirect_to posts_path
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
  end
  
  def destroy
    @post = current_user
    @post.destroy
    redirect_to post_path
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :content, :public_flag)
  end
  
end
