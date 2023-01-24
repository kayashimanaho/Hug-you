class Public::PostsController < ApplicationController
   before_action :authenticate_user!, only: [:show, :create]
  def index
    #キーワード検索
    # if params[:search]
      @posts = Post.search(params[:search]).page(params[:page]).per(6)
    # else
    #   @posts = Post.page(params[:page]).per(5)
    # end
    
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
  
  def edit
    @post = Post.find(params[:id])
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
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿の変更に成功しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end
  
  def destroy
    @post = current_user
    @post.destroy
    redirect_to posts_path
   
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
  
end
