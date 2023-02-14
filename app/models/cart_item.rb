class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  def stock_array_maker(current_stock)
      current_stock < 10 ? [*1..current_stock] : [*1..10]
  end
  
  def subtotal
    item.with_tax_price
  end
end
