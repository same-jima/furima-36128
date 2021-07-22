# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| age                | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |

###Association
- belongs_to :item
- belongs_to :order

## items テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| item_date    | string        | null: false                    |
| item_text    | string        | null: false                    |
| category     | string        | null: false                    |
| condition    | string        | null: false                    |
| delivery     | string        | null: false                    |
| area         | string        | null: false                    |
| days         | string        | null: false                    |
| user         | references    | null: false, foreign_key: true |

###Association
- has_many :users
- has_many :orders

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
