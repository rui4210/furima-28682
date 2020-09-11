class Order < ApplicationRecord
  

  #アソシエーション
  belongs_to :item_purchase

end
