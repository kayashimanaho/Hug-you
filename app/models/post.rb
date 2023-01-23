class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites,dependent: :destroy
  has_many :post_tags,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :post_keywords,dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
   def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      where(['content LIKE ?', "%#{search}%"])
    else
      all #全て表示。
    end
   end
end
