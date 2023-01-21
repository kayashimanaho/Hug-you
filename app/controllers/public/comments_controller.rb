class Public::CommentsController < ApplicationController
  def index
  end
  
  def create
    posts = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = posts.id
    comment.save
    redirect_to post_path(posts)
  end

  def destroy
    #byebug
    #@comment = current_user
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])    
    comment.destroy
    redirect_to  post_path(post.id)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment,:user_id, :post_id)
  end
end
