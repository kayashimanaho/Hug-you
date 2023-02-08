class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
     @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end  
  end
  
  def update
    notification=Notification.find(params[:id]) #...①
    if notification.update(checked: true) #...②
      redirect_to action: :index
    end
  end
end
