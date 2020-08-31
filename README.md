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
- has_one :item_purchase

##　buys テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| post_number         | string    | null: false |
| prefecture          | integer   | null: false |
| city                | string    | null: false |
| address             | string    | null: false |
| building_name       | string    |             |
| phone_number        | string    | null: false |
| item_purchases      | reference | null: false, foreign_key: true |

### Association
- belongs_to :item_purchase

## item_purchases　テーブル
| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| user                | reference | null: false, foreign_key: true |
| item                | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buy