class Admin::OrdersController < ApplicationController
  
  def show
    @total = 0
    @shipping_cost = 800
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if @order.status_i18n == "入金確認"
        @order_details.each do |order_detail|
          order_detail.making_status = 1
          order_detail.save
        end
      end

    end
    redirect_to admin_order_path(@order)
  end
  
  private

  def order_params 
    params.require(:order).permit(:status)
  end
end
