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
| birth_yaer       | string | null: false |
| birth_month      | string | null: false |
| birth_day        | string | null: false |

### Association
- has_many :items
- has_many :buys

##　items テーブル

| Column           | Type      | Options     |
| ---------------- | -------   | ----------- |
| item_name        | string    | null: false |
| category         | string    | null: false |
| price            | integer   | null: false |
| product_status   | string    | null: false |
| shipping_charges | string    | null: false |
| shipping_region  | string    | null: false |
| image            | text      | null: false |
| desecription     | text      | null: false |
| nickname         | reference | foreign_key: true |

### Association
- belings_to :users
- belongs_to :buys

##　buys テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| credit_card         | integer | null: false |
| card_validity_year  | integer | null: false |
| card_validity_month | integer | null: false |
| cvc                 | integer | null: false |
| post_number         | integer | null: false |
| prefecture          | string  | null: false |
| city                | string  | null: false |
| adress              | text    | null: false |
| buolding_name       | text    | null: false |
| phone_number        | integer | null: false |

### Association
- belings_to :users
- belongs_to :items
