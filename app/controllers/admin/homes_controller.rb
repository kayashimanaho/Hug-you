class Admin::HomesController < ApplicationController
  def top
    #@users = User.page(params[:page]).per(9)
    @users = User.all
  end
end
