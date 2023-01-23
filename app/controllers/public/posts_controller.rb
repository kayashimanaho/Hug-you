class Public::PostsController < ApplicationController
   before_action :authenticate_user!, only: [:show, :create]
  def index
    #キーワード検索
    @posts = post.paginate(page: params[:page], per_page: 5).search(params[:search])
    @post = Post.new
    #いいねランキング
    @posts_favorites = Post.group(:user_id).includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
   
    #@posts = User.find(params[:id]).posts.all
    
    
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # @user = User.find(params[:id])
    @comments = @post.comments #投稿ごとにコメントを分ける
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
