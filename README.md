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
- has_many :comment
- has_many :item, through: comment
- has_one :pay
- has_one :sending_address

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| price               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| category_id         | integer    | null: false                    |
| item_condition_id   | integer    | null: false                    |
| shipping_costs_id   | integer    | null: false                    |
| shipping_address_id | integer    | null: false                    |
| derivery_date_id    | integer    | null: false                    |

### Association
belongs_to :user
has_many :comment
has_one :pay

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
belongs_to :user
belongs_to :item

## pays テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

## sending_address テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| firstname(zen)  | string    | null: false                    |
| lastname(zen)   | string    | null: false                    |
| firstname(kana) | string    | null: false                    |
| lastname(kana)  | string    | null: false                    |
| post_code       | integer   | null: false                    |
| prefecture      | integer   | null: false                    |
| city            | string    | null: false                    |
| house_number    | string    | null: false                    |
| building_name   | string    |                                |
| phone_number    | integer   | null: false                    |
| user            | references| null: false, foreign_key: true |

### Association
belongs_to :user

