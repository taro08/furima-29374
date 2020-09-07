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


# テーブル設計

## user テーブル

| Column     | Type    | Options     |
| --------   | ------  | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| year_bday  | integer | null: false |
| month_bday | integer | null: false |
| day_bday   | integer | null: false |

### Association

- has_many :products
- has_many :purchases

## product テーブル

| Column                | Type    | Options      |
| --------------------- | --------| ------------ |
| product_name          | string  | null: false  |
| product_description   | string  | null: false  |
| category              | string  | null: false  |
| price                 | integer | null: false  |
| product_status        | string  | null: false  |
| user_id               | integer | null: false  |

### Association

- belongs_to :user
- has_one :purchase

## Purchase テーブル

| Column                 | Type    | Options     |
| ---------------------- | --------| ------------|
| delivery_time          | string  | null: false |
| consignor_area         | string  | null: false |
| shipping_costs_burden  | string  | null: false |
| user_id                | integer | null: false |
| product_id             | integer | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :delivery

## delivery テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| postal_code            | integer | null: false |
| prefecture             | string  | null: false |
| city                   | string  | null: false |
| house_number           | string  | null: false |
| building               | string  | null: false |
| phone_number           | integer | null: false |
| purchase_id            | integer | null: false |

### Association

- belongs_to :purchase
