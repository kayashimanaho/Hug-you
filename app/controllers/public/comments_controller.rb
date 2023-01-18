class Public::CommentsController < ApplicationController
  def index
  end
  
  def create
    posts = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(posts)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:user_id, :post_id)
  end
