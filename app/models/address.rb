class Address < ApplicationRecord
  belongs_to :user
  
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
