
## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | date   | null: false |

### Association
- has_many :items
- has_many :purchanse


## items テーブル

| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| name              | string     | null: false                   |
| acount            | text       | null: false                   |
| state             | integer    | null: false                   |
| postage           | integer    | null: false                   |
| region            | integer    | null: false                   |
| shipping_date     | integer    | null: false                   |
| price             | integer    | null: false                   |
| category          | integer    | null: false                   |
| user_id           | integer    | null: false, foreign_key: true|
        
### Association
- belongs_to: user
- has_one   : purchanse


## purchanse テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |


### Association
- belongs_to : item
- belongs_to : user
- has_one    : delivery

## delivery テーブル

| Column       | Type       | Options                        |
| ---------    | ---------- | ------------------------------ |
| purchanse_id | integer    | null: false, foreign_key: true |
| zip          | string     | null: false                    |
| purefecture  | integer    | null: false                    |
| city         | string     | null: false                    |
| reference    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |


### Association
- belongs_to : purchanse
