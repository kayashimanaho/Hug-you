class Admin::CommentsController < ApplicationController
  def index 
    @comments = Comment.page(params[:page]).per(10)
    
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    # @posts = Post.
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to  admin_comments_path
    
  end
  
    private

  def comment_params
    params.require(:comment).permit(:comment,:user_id, :post_id)
  end
end
