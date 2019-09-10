# README

## creditcardテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, add_index unique: true|
|password|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birth_date|string|null: false|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_address|string|null: false|
|building_name|string||
|phone_number|string||
|avatar|string||
|description|text||

### Association
- has_many :items
- has_many :item_likes
- has_many :liked_items, through: :item_likes, source: :item
- has_many :item_comments
- has_many :trades
- has_many :trade_comments
- has_many :user_reviews
- has_one :credit_card
- belongs_to :prefecture, optional: true


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add index|
|price|integer|null: false|
|description|text|null: false|
|condition|integer|null: false|
|task|integer|null: false|
|payer_delivery_expense|integer|null: false|
|delivery_days|integer|null: false|
|prefecture|string|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :item_images
- belongs_to :category
- belongs_to :size, optional: true
- belongs_to :prefecture
- has_many :item_likes
- has_many :liked_users, through: :items_likes, source: :user
- has_many :item_comments
- has_one :trade


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :items


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## item_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## item_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false, add index|

### Association
- has_many :items


## tradesテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|status|integer|null: false|

### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :item


## trade_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|user_id|references|foreign_key: true|
|trade_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :trade


## user_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|score|integer||
|comment|string||
|user_id|references|foreign_key: true|
|trade_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :trade
