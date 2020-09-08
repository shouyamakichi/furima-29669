
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
- has_many :purchanses


## items テーブル

| Column            | Type       | Options                       |
| ------            | ------     | -----------                   |
| name              | string     | null: false                   | <!--商品名>
| acount            | text       | null: false                   | <!--商品説明>
| state             | integer    | null: false                   | <!--商品状態>
| postage           | integer    | null: false                   | <!--配送料負担>
| region            | integer    | null: false                   | <!--発送元地域>
| shipping_date     | integer    | null: false                   | <!--発送までの日数>
| price             | integer    | null: false                   | <!--価格>
| category          | integer    | null: false                   | <!--カテゴリー>
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
