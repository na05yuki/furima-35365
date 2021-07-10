# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items

## items テーブル

| Column            | Type    | Options                        |
| ----------------- | ------- | ------------------------------ |
| item_name         | string  | null: false                    |
| item_explanation  | text    | null: false                    |
| category          | string  | null: false                    |
| status            | string  | null: false                    |
| delivery_charge   | string  | null: false                    |
| shipping_area     | string  | null: false                    |
| days_to_ship      | string  | null: false                    |
| price             | string  | null: false                    |
| user_id           | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :card
- has_one :shopping_address

##  cardテーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| card_number           | string     | null: false |
| validity_period_month | string     | null: false |
| validity_period_year  | string     | null: false |
| security_code         | string     | null: false |

### Association

- belongs_to :items

##  shopping_addressテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| zip_code      | string  | null: false                    |
| prefectures   | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  | null: false                    |
| phone_number  | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :items
