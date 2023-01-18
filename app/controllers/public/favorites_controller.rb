class Public::FavoritesController < ApplicationController
  def create
    posts = Posts.find(params[:posts_id])
    favorite = current_user.favorites.new(posts_id: posts.id)
    favorite.save
    redirect_to post_path(posts)
  end

  def destroy
    posts = Posts.find(params[:posts_id])
    favorite = current_user.favorites.find_by(posts_id: posts.id)
    favorite.destroy
    redirect_to post_path(posts)
  end

end
