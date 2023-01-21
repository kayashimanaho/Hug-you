class Admin::CommentsController < ApplicationController
  def index 
    @comments = Comment.page(params[:page]).per(10)
    
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
    private

  def comment_params
    params.require(:comment).permit(:comment,:user_id, :post_id)
  end
end
