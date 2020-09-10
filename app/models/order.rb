class Order < ApplicationRecord
  #都道府県（ActiveHash）のアソシエーションの設定
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  
  #アソシエーション
  belongs_to :item_purchase

end
