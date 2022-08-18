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
| is_seller          | references                | null: false, foreign_key: true |
| is_sold            | boolean                   | null: false, default: false    |
| category           | references                | null: false, foreign_key: true |
| quality            | references                | null: false, foreign_key: true |
| postage            | references                | null: false, foreign_key: true |
| shipping_day       | references                | null: false, foreign_key: true |
| prefecture         | references                | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :categories
- belongs_to :qualities
- belongs_to :postages
- belongs_to :shipping_days
- belongs_to :prefectures
- beloongs_to :purchases



## categoriesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| category_option    | string                    | null: false                    |

### Association
- has_many :items

#### Gem
ative_hash

## qualitiesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| quality_option     | string                    | null: false                    |

### Association
- has_many :items

#### Gem
ative_hash

## postagesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| postage_option     | string                    | null: false                    |

### Association
- has_many :items

#### Gem
ative_hash

## shipping_daysテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| duration_option    | string                    | null: false                    |

### Association
- has_many :items

#### Gem
ative_hash

## prefecturesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| prefecture_option  | string                    | null: false                    |

### Association
- has_many :items
- has_many :addresses

#### Gem
ative_hash

## purchasesテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| is_purchaser       | references                | null: false, foreign_key: true |
| item               | references                | null: false, foreign_key: true |
| purchase_info      | references                | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase_info
- has_one :item

## purchase_infoテーブル
| Column             | Type                      | Options                        |
| ------------------ | ------------------------- | ------------------------------ |
| card_number        | string                    | null: false                    |
| card_expired_date  | string                    | null: false                    |
| cvc                | string                    | null: false                    |
| zipcode            | string                    | null: false                    |
| prefecture         | references                | null: false, foreign_key: true |
| city               | string                    | null: false                    |
| street             | string                    | null: false                    |
| building           | string                    | null: false                    |
| phone_number       | string                    | null: false                    |
| purchases          | references                | null: false, foreign_key: true |

### Association
- belongs_to :purchases
