# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| birth_date     | date   | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_cost_id | integer    | null: false                    |
| delivery_area_id | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| sales_price      | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :buy
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_cost
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_time


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| order          | references | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |


### Association
- belongs_to :order


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
