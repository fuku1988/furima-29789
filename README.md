# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| birth date | string | null: false |

### Association
- has_many :items
- has_many :buys


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| users_id         | references | null: false, foreign_key: true |
| image            | string     | null: false                    |
| item_name        | string     | null: false                    |
| item_description | string     | null: false                    |
| items_category   | string     | null: false                    |
| items_condition  | string     | null: false                    |
| delivery_cost    | string     | null: false                    |
| delivery_area    | string     | null: false                    |
| delivery_time    | string     | null: false                    |
| sales_price      | string     | null: false                    |
| sales_commission | string     | null: false                    |
| sales_profit     | string     | null: false                    |

### Association
- belongs_to :users
- has_one :buys


## buys テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| users_id         | references | null: false, foreign_key: true |
| items_id         | references | null: false, foreign_key: true |
| image            | references | null: false, foreign_key: true |
| item_name        | references | null: false, foreign_key: true |
| item_description | references | null: false, foreign_key: true |
| creditcard_number| string     | null: false                    |
| expiration_date  | string     | null: false                    |
| security_code    | string     | null: false                    |
| postal code      | string     | null: false                    |
| Prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phon_number      | string     | null: false                    |


### Association
- belongs_to :items
- belongs_to :users


===
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
