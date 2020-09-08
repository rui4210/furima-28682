class Order < ApplicationRecord
  #アソシエーション
  belongs_to :item_purchase

  #購入者情報
  #必須であること
  with_options presence: true do
    #郵便番号
    validates :post_number
    #都道府県
    validates :prefecture
    #市区町村
    validates :city
    #番地
    validates :address
    #電話番号
    validates :phone_number
  end

   #郵便番号は-（ハイフン）を含む必要があること
   VALID_POSTNUMBER_REGEX = /\A\d{3}[-]\d{4}\z/
   validates :post_number, format: { with: VALID_POSTNUMBER_REGEX }
   #電話番号は-（ハイフン）不要で、11桁以内であること
   VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/
   validates :post_number, format: { with: VALID_PHONENUMBER_REGEX }
end
