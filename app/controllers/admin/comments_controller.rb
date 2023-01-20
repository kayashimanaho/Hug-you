class Admin::CommentsController < ApplicationController
  def index 
    @comments = Comment.page(params[:page]).per(10)
    
  end
end
