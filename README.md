# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### association
- has_many :orders

## shops テーブル
| Column        | Type    | Options                  |
| ------------- | ------- | ------------------------ |
| name          | string  | null: false              |
| email         | string  | null: false              |
| password      | string  | null: false              |
| phone_number  | string  | null: false              |
| postal_code   | string  | null: false, default: "" |
| area          | integer | null: false              |
| city          | string  | null: false, default: "" |
| address       | string  | null: false, default: "" |
| building_name | string  |                          |

### association
- has_many :meals

## meals テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| genre       | integer    | null: false                    |
| protein     | integer    | null: false                    |
| fat         | integer    | null: false                    |
| carbo       | integer    | null: false                    |
| price       | integer    | null: false                    |
| shop        | references | null: false, foreign_key: true |


### association
- has_one :order
- belongs_to :shop

## orders テーブル
| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| meal   | references  | null: false, foreign_key: true |
| user   | references  | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :meal
- has_one :address

## addresses テーブル
| Column         | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| postal_code   | string     | null: false, default: ""       |
| area          | integer    | null: false                    |
| city          | string     | null: false, default: ""       |
| address       | string     | null: false, default: ""       |
| building_name | string     |                                |
| phone_number  | string     | null: false, default: ""       |
| address       | references | null: false, foreign_key: true |

### association
- belongs_to :address