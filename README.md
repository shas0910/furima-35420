## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| image         | ActiveStorage | null: false                    |
| name          | string        | null: false                    |
| description   | string        | null: false                    |
| category_id   | integer       | null: false                    |
| status_id     | integer       | null: false                    |
| charge_id     | integer       | null: false                    |
| prefecture_id | integer       | null: false                    |
| shipment_id   | integer       | null: false                    |
| price         | integer       | null: false                    |
| user          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## addresses

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order