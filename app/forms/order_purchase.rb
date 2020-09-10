class OrderPurchase

  include ActiveModel::Model
  attr_accessor :post_number, :prefecture, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

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
    #カード情報
    validates :token
  end

  #郵便番号は-（ハイフン）を含む必要があること
  VALID_POSTNUMBER_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :post_number, format: { with: VALID_POSTNUMBER_REGEX }
  #電話番号は-（ハイフン）不要で、11桁以内であること
  VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX }
  #都道府県の選択が「--」の時は保存できないようにする
  validates :prefecture, numericality: { other_than: 1 } 

  def save
    item_purchase = ItemPurchase.create!(user_id: user_id, item_id: item_id)
    Order.create!(post_number: post_number, prefecture: prefecture, city: city, address: address, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end