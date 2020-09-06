class Item < ApplicationRecord
  #カテゴリー（ActiveHash）のアソシエーションの設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  #商品の状態（ActiveHash）のアソシエーションの設定
  belongs_to_active_hash :product_status
  #配送料の負担（ActiveHash）のアソシエーションの設定
  belongs_to_active_hash :shipping_charge
  #配送元の地域（ActiveHash）のアソシエーションの設定
  belongs_to_active_hash :shipping_region
  #配送までの日数（ActiveHash）のアソシエーションの設定
  belongs_to_active_hash :shipping_day
  
  #アソシエーション
  belongs_to :user
  has_one :item_purchase
  #Active Storageのアソシエーション
  has_one_attached :image

  #商品情報
  #必須であること
  with_options presence: true do
    #商品画像
    validates :image
    #商品名
    validates :name
    #商品の説明
    validates :description
    #カテゴリーの情報
    validates :category_id
    #商品の状態
    validates :product_status_id
    #配送料の負担
    validates :shipping_charges_id
    #発送元の地域
    validates :shipping_region_id
    #発送までの日数
    validates :shipping_day_id
    #価格
    validates :price
  end

  #価格の範囲が、¥300~¥9,999,999の間であること
  validates :price, inclusion: { in: 300..9999999 }
  #販売価格は半角数字のみ入力可能であること
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }
  
  #「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    #カテゴリーの選択
    validates :category_id
    #商品の状態の選択
    validates :product_status_id
    #配送料の負担の選択
    validates :shipping_charges_id
    #発送元の地域の選択
    validates :shipping_region_id
    #発送までの日数の選択が「--」の時は保存できないようにする
    validates :shipping_day_id
  end
end
