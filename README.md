# README

=======
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
- has_many :buys

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
| desecription     | text      | null: false |
| user             | reference | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buy

##　buys テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| post_number         | string  | null: false |
| prefecture          | integer | null: false |
| city                | string  | null: false |
| adress              | text    | null: false |
| buolding_name       | text    | null: false |
| phone_number        | string  | null: false |

### Association
- belongs_to :user
- belongs_to :item
