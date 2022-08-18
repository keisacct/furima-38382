# テーブル設計

## usersテーブル

| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | -------------------------------|
| nickname           | string                    | null: false                    |
| email              | string                    | null: false, unique: true      |
| encrypted_password | string                    | null: false                    |
| last_name_kanji    | string                    | null: false                    |
| first_name_kanji   | string                    | null: false                    |
| last_name_kata     | string                    | null: false                    |
| first_name_kata    | string                    | null: false                    |
| dob                | date                      | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | -------------------------------|
| title              | string                    | null: false                    |
| description        | text                      | null: false                    |
| price              | integer                   | null: false                    |
| user               | references                | null: false, foreign_key: true |
| category_id        | integer                   | null: false                    |
| quality_id         | integer                   | null: false                    |
| postage_id         | integer                   | null: false                    |
| shipping_day_id    | integer                   | null: false                    |
| prefecture_id      | integer                   | null: false                    |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :quality
- belongs_to :postage
- belongs_to :shipping_day
- belongs_to :prefecture
- has_one :purchase

## purchasesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| user               | references                | null: false, foreign_key: true |
| item               | references                | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item

## addressesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| zipcode            | string                    | null: false                    |
| prefecture_id      | integer                   | null: false                    |
| city               | string                    | null: false                    |
| street             | string                    | null: false                    |
| building           | string                    |                                |
| phone_number       | string                    | null: false                    |
| purchase           | references                | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :prefecture