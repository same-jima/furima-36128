# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| birth_day          | date   | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |

###Association
- has_many :item
- has_many :order

## items テーブル

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| name            | string        | null: false                    |
| text            | text          | null: false                    |
| category_id     | integer       | null: false                    |
| condition_id    | integer       | null: false                    |
| delivery_id     | integer       | null: false                    |
| area_id         | integer       | null: false                    |
| delivery_day_id | integer       | null: false                    |
| price           | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |

###Association
- belongs_to :user
- belongs_to :order

## orders テーブル

| Column              | Type         | Options                         |
| ------------------- | ------------ | ------------------------------- |
| postal_code_id      | integer      | null: false                     |
| area_id             | integer      | null: false                     |
| municipality_id     | integer      | null: false                     |
| address             | string       | null: false                     |
| building            | string       |                                 |
| phone_num           | string       | null: false                     |
| order_tags          | references   | null: false, foreign_key: true  |

###Association
- has_many :order_tag

## order_tags テーブル

| Column              | Type         | Options                         |
| ------------------- | ------------ | ------------------------------- |
| name                | string       |                                 |
| item                | references   | null: false, foreign_key: true  |
| order               | references   | null: false, foreign_key: true  |

###Association
- belongs_to :item
- belongs_to :order