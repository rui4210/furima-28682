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
  #商品名が必須であること
  validates :name, presence: true
  #商品の説明が必須であること
  validates :description, presence: true
  #カテゴリーの情報が必須であること
  validates :category_id, presence: true
  #商品の状態についての情報が必須であること
  validates :product_status_id, presence: true
  #配送料の負担についての情報が必須であること
  validates :shipping_charges_id, presence: true
  #発送元の地域についての情報が必須であること
  validates :shipping_region_id, presence: true
  #発送までの日数についての情報が必須であること
  validates :shipping_day_id, presence: true
  #価格についての情報が必須であること
  validates :price, presence: true
  #価格の範囲が、¥300~¥9,999,999の間であること
  validates :price, inclusion: { in: 300..9999999 }
  #販売価格は半角数字のみ入力可能であること
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }
  #カテゴリーの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  #商品の状態の選択が「--」の時は保存できないようにする
  validates :product_status_id, numericality: { other_than: 1 }
  #配送料の負担の選択が「--」の時は保存できないようにする
  validates :shipping_charges_id, numericality: { other_than: 1 }
  #発送元の地域の選択が「--」の時は保存できないようにする
  validates :shipping_region_id, numericality: { other_than: 1 }
  #発送までの日数の選択が「--」の時は保存できないようにする
  validates :shipping_day_id, numericality: { other_than: 1 }
end
