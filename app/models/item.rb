class Item < ApplicationRecord
  # has_many :orders, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :user
  # has_many :notifications, dependent: :destroy
  
#  has_one_attached :image
  has_many_attached :images
  
  # 画像に枚数制限をかける
  FILE_NUMBER_LIMIT = 4
  
  # バリデーション
  validates :name, presence: true
  validates :images, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :status, presence: true
  # 画像に枚数制限をかける
  validate :validate_number_of_files
   
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
  
  private
  
  def validate_number_of_files
    return if images.length <= FILE_NUMBER_LIMIT
    errors.add(:images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end
end
  

