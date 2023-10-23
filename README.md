## users

| Column   | Type   | Options     |
| -------- | ----   | ------------|
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items
- has_many :orders



## items

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| detail   | text       | null: false                    |
| image    | string     | null: false                    |
| category | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order



## orders

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item



## addresses

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| post_code  | integer    | null: false                    |
| city       | string     | null: false                    |
| street     | string     | null: false                    |
| building   | string     |                                |
| tel_number | integer    | null: false                    |
| order      | references | null: false, foreign_key: true |

### Association
- belongs_to :order