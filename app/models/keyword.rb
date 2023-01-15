class Keyword < ApplicationRecord
  has_many :post_keywords,dependent: :destroy
end
