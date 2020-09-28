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
- has_many :buys


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


## buys テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## address テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| buy            | references | null: false, foreign_key: true |
| postal code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phon_number    | string     | null: false                    |


### Association
- belongs_to :buy


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
