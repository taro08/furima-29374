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

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_day          | date    | null: false |


### Association

- has_many :products
- has_many :purchases

## product テーブル

| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| category               | integer    | null: false                    |
| price                  | integer    | null: false                    |
| status                 | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| delivery_time          | integer    | null: false                    |
| consignor_area         | integer    | null: false                    |
| shipping_costs_burden  | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## Purchase テーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| -------------------------------|
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :delivery

## delivery テーブル

| Column                 | Type       | Options                         |
| ---------------------- | ---------- | ------------------------------- |
| postal_code            | string     | null: false                     |
| prefecture             | integer    | null: false                     |
| city                   | string     | null: false                     |
| house_number           | string     | null: false                     |
| building               | string     |                                 |
| phone_number           | string     | null: false                     |
| purchase               | references | null: false , foreign_key: true |

### Association

- belongs_to :purchase
