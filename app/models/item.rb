class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  has_one_attached :image
  # has_many_attached :images
  
  validates :name, presence: true
  # validates :image, presence: true
   
   def add_tax_price
    (self.price * 1.10).round
   end
   
   def with_tax_price
    (price * 1.1).floor
   end
   
   def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jng')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     image.variant(resize_to_limit: [width, height]).processed
   end
    
  module Item
  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
  end
  
end
