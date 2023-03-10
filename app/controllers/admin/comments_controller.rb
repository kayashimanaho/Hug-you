class Admin::CommentsController < ApplicationController
  def index 
    @comments = Comment.page(params[:page]).per(10)
    
  end
  
  def show
    # @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
  
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    comment  = Comment.find(params[:id])
    if comment.update(comment_params)
      flash[:notice] = "コメントの変更に成功しました"
      redirect_to admin_post_path(comment.post_id)
    else
      render :edit
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントの削除に成功しました"
    redirect_to  admin_posts_path
    
  end
  
    private

  def comment_params
    params.require(:comment).permit(:comment,:user_id, :post_id)
  end
end
