class Admin::PostsController < ApplicationController
   def index 
    @posts = Post.page(params[:page]).per(10)
    @comments = Comment.page(params[:page]).per(10)
    #@post =Post.find(params[:id])
   end
  
  def show
    @post = Post.find(params[:id])
    
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿の変更に成功しました"
      redirect_to admin_posts_path
    else
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to  admin_posts_path
    
  end
  
    private

  def post_params
    params.require(:post).permit(:status,:user_id, :content)
  end
end
