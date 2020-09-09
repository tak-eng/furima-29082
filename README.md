# テーブル設計

## users テーブル

| Column          | Type   | Options                    |
| --------------- | ------ | -------------------------- |
| nickname        | string | null: false, unique :true  |
| email           | string | null: false, unique :true  |
| password        | string | null: false                |
| password(Re)    | string | null: false                |
| firstname(zen)  | string | null: false                |
| lastname(zen)   | string | null: false                |
| firstname(kana) | string | null: false                |
| lastname(kana)  | string | null: false                |
| birthday        | date   | null: false                |

### Association
- has_many :comments
- has_many :items, through: comments
- has_one :pays

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| exhibiter_id     | references | null: false, foreign_key: true |
| category         | integer    | null: false                    |
| item_condition   | integer    | null: false                    |
| shipping_costs   | integer    | null: false                    |
| shipping_address | integer    | null: false                    |
| derivery_date    | integer    | null: false                    |

### Association
belongs_to :users
has_many :comments
has_one :pays

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
belongs_to :users
belongs_to :items

## pays テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :items
