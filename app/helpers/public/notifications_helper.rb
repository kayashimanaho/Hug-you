module Public::NotificationsHelper

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

  def show_item_user(notification)
    notification.order.order_details.each do |order_detail|
      if order_detail.item.user.id == notification.visited_id
        # 商品を出品した人のidと通知の出品した人のidが一致していればその人の出品している商品名を返す
        return order_detail.item.name
      end
    end
  end
end
