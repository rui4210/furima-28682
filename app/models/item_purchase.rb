class ItemPurchase < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :order
end
