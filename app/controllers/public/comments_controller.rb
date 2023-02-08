class Public::CommentsController < ApplicationController
  def edit
   @post = Post.find(params[:id])  
   @comment = Comment.find(params[:post_id])
  end
  
  def create
    posts = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = posts.id
    comment.save
    flash[:notice] = "コメントの投稿にに成功しました"
    redirect_to post_path(posts)
  end
  
  def update
    comment = Comment.find(params[:post_id])
    if comment.update(comment_params)
      flash[:notice] = "コメントの変更に成功しました"
      redirect_to post_path
    else
      render :edit
    end
    
  end

  def destroy
    #byebug
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])    
    comment.destroy
    flash[:notice] = "コメントの削除に成功しました"
    redirect_to  post_path(post.id)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment,:user_id, :post_id)
  end
end
