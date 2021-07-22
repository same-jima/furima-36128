# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| age                | date   | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |

###Association
- has_many :items
- belongs_to :order

## items テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| item_date    | string        | null: false                    |
| item_text    | string        | null: false                    |
| category     | integer       | null: false                    |
| condition    | integer       | null: false                    |
| delivery     | integer       | null: false                    |
| area         | string        | null: false                    |
| day          | string        | null: false                    |
| price        | string        | null: false                    |
| user         | references    | null: false, foreign_key: true |

###Association
- has_many :users
- has_many :orders
- has_many :orders, through: :order_tags

## orders テーブル

| Column              | Type         | Options                         |
| ------------------- | ------------ | ------------------------------- |
| card_information    | string       | null: false                     |
| expiration_date     | string       | null: false                     |
| security_code       | string       | null: false                     |
| postal_code         | string       | null: false                     |
| prefectures         | string       | null: false                     |
| municipalities      | string       | null: false                     |
| address             | string       | null: false                     |
| building            | string       |                                 |
| phone_num           | string       | null: false                     |
| user                | references   | null: false, foreign_key: true  |
| item                | references   | null: false, foreign_key: true  |

###Association
- has_many :users
- has_many :items
- has_many :items, through: :order_tags

## order_tags テーブル

| Column              | Type         | Options                         |
| ------------------- | ------------ | ------------------------------- |
| item                | references   | null: false, foreign_key: true  |
| order               | references   | null: false, foreign_key: true  |

###Association
- belongs_to :items
- belongs_to :orders