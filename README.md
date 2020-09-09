# テーブル設計

## users テーブル

| Column   | Type   | Options                    |
| -------- | ------ | -------------------------- |
| name     | string | null: false, unique :true  |
| email    | string | null: false, unique :true  |
| password | string | null: false                |

### Association
- has_many :comments
- has_many :items, through: comments
- has_one :pays

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | Mediumblob | null: false                    |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| exhibiter_id     | references | null: false, foreign_key: true |
| category         | string     | null: false                    |
| item_condition   | string     | null: false                    |
| shipping_costs   | string     | null: false                    |
| shipping_address | string     | null: false                    |
| derivery_date    | string     | null: false                    |

### Association
belongs_to :users
has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
belongs_to :users
belongs_to :items

## pays テーブル

| Column                 | Type       | Options                        |
| -------                | ---------- | ------------------------------ |
| card-number            | string     | null: false, unique :true       |
| user_id                | references | null: false, foreign_key: true |
| expiration-date(year)  | integer    | null: false                    |
| expiration-date(month) | integer    | null: false                    |
| security-cord          | intefer    | null: false                    |

### Association
belongs_to :users
