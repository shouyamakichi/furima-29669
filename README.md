
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |

### Association
- has_many :items
- has_many :purchanse


## items テーブル

| Column   | Type       | Options                       |
| ------   | ------     | -----------                   |
| image    | string     | null: false                   |
| item-name| string     | null: false                   |
| acount   | text       | null: false                   |
|  user    | references | null: false, foreign_key: true|

### Association
- belong_to: user
- has_many : purchanse


## purchanse テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |
| cardnews| string     | null: false                    |
| validity| string     | null: false                    |
| security| string     | null: false                    |


### Association
- belongs_to : item
- belongs_to : user
- has_one    : delivery

## delivery テーブル

| Column       | Type       | Options                        |
| ---------    | ---------- | ------------------------------ |
| purchanse    | references | null: false, foreign_key: true |
| zip          | string     | null: false                    |
| purefecture  | string     | null: false                    |
| city         | string     | null: false                    |
| reference    | string     | null: false                    |
| building     | string     | null: false                    |
| number       | string     | null: false                    |


### Association
- belongs_to : purchanse
