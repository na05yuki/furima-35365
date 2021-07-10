# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_managements

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_management

##  purchase_managementテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| shopping_address    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopping_address

##  shopping_addressテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| zip_code               | string     | null: false                    |
| prefectures_id         | integer    | null: false                    |
| city                   | string     | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | string     | null: false                    |
| purchase_management    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_management
