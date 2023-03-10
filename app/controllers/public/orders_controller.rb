class Public::OrdersController < ApplicationController
   def new
    @order = Order.new
    @addresses = current_user.addresses
   end

  def confirm

    # @total = 0
    @shipping_cost = 800

    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @cart_items = current_user.cart_items.all
    @address = current_user

    if params[:address_option] == "0"
        @order.postal_code = current_user.postal_code
        @order.address = current_user.address
        @order.name = current_user.name
    elsif params[:address_option] == "1"
    	  @address_id = params[:address_id].to_i
    	  @order_address = Address.find(@address_id)
    	  @order.postal_code = @order_address.postal_code
    	  @order.address = @order_address.address
    	  @order.name = @order_address.name
    elsif params[:address_option] == "2"
    	  @order.postal_code = params[:order][:postal_code]
    	  @order.address = params[:order][:address]
    	  @order.name = params[:order][:name]
    end
  	@order.total_payment = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.item.with_tax_price }
  end

  def complete
  end

  def create
    @cart_items = current_user.cart_items
    @order = Order.new(order_params)
    @order.total_payment = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.item.with_tax_price }
    @shipping_cost = 800
    @order.status = 0
    if @order.save!
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.price = cart_item.item.with_tax_price
        # @order_detail.amount = cart_item.amount
        @order_detail.making_status = 0
        @order_detail.save!
        @order.notifications.create(
          visited_id: @order_detail.item.user_id,
          #商品の詳細に紐付いている出品者のid
          visitor_id: current_user.id,
          #買った人のid
          action: 'purchase'
        )
        current_user.cart_items.destroy_all
      end
      redirect_to complete_orders_path
    else
      # if文バリデーション記述
      render :new
    end
  end
  def index
    @cart_items = current_user.cart_items
    @orders = current_user.orders.page(params[:page]).per(8)
  end

  def show
    @total = 0
    @shipping_cost = 800
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

   private

def order_params
     params.require(:order).permit(:name,:shipping_cost,:total_payment,:payment_method,:status,:user_id,:postal_code,:address)
end
end
