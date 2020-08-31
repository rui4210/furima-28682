# README


##　users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association
- has_many :items
- has_many :item_purchases

##　items テーブル

| Column           | Type      | Options     |
| ---------------- | -------   | ----------- |
| name  　　　      | string    | null: false |
| category         | string    | null: false |
| price            | integer   | null: false |
| product_status   | integer   | null: false |
| shipping_charges | integer   | null: false |
| shipping_region  | integer   | null: false |
| shipping_day     | integer   | null: false |
| image            | text      | null: false |
| description      | text      | null: false |
| user             | reference | foreign_key: true |

### Association
- belongs_to :user
- has_one :item_purchases

##　buys テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| post_number         | string    | null: false,foreign_key:true |
| prefecture          | integer   | null: false,foreign_key:true |
| city                | string    | null: false,foreign_key:true |
| address             | text      | null: false,foreign_key:true |
| building_name       | text      | foreign_key:true             |
| phone_number        | string    | null: false,foreign_key:true |
| item_purchases_id   | reference | null: false, foreign_key: true |

### Association
- belongs_to :item_purchases

## item_purchases　テーブル
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| user_id             | reference | null: false, foreign_key: true |
| item_id             | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buy