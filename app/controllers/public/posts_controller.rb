class Public::PostsController < ApplicationController
   before_action :authenticate_user!, only: [:show, :create]
  def index
    #キーワード検索と新着投稿順
    @posts = Post.search(params[:search]).order(created_at: :desc).page(params[:page]).per(6)
    
    @post = Post.new
    #いいねランキング
    @user_favorites = User
      .joins({posts: :favorites})
      .group("posts.user_id")
      .select("users.*, count(favorites.id) AS favorite_count")
      .having("users.is_deleted = false")
      .order("count(favorites.id) DESC")
      .limit(10)
    
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # @user = User.find(params[:id])
    @comments = @post.comments #投稿ごとにコメントを分ける
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      flash[:notice] = "投稿が成功しました."
       redirect_to posts_path
    else
      posts = Post.all
      user = current_user
      render :index
    end
  end
  
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      flash[:notice] = "投稿の変更に成功しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
   
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
  
end
