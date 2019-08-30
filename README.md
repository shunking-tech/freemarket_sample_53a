# README

## creditcardテーブル

|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|index: true|
|email|string|add_index unique: true|
|password|string||
|avatar|string||
|discription|text||
|firstname|string||
|firstname_kana|string||
|lastname_kana|string||
|birth_date|string||
|phone_number|string||
|prefecture_id|references|foreign_key: true|
|city|string||
|house_address|string||
|building_name|string||
|zipcode|string|add_index unique: true|

### Association
- has_many :items
- has_many :item_likes
- has_many :liked_items, through: :item_likes, source: :items
- has_many :item_comments
- has_many :trades
- has_many :trade_comments
- has_many :user_reviews
- has_many :credit_cards
- belongs_to :prefecture, optional: true


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|validates, presence: true|
|price|integer||
|description|text|validates, presence: true|
|condition|integer||
|task|integer||
|payer_delivery_expense|integer||
|delivery_days|integer||
|prefecture_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|l_category_id|references|foreign_key: true|
|size_id|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :item_images
- belongs_to :l_category
- belongs_to :size, optional: true
- belongs_to :prefecture
- has_many :item_likes
- has_many :liked_users, through: :likes, source: :user
- has_many :item_comments
- has_one :trade


## prefecturesテーブル

|name|string||

### Association
- has_many :users
- has_many :items


## sizesテーブル

|size|string||

### Association
- has_many :items


## item_likesテーブル

|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## item_commentsテーブル

|content|string||
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## l_categoriesテーブル

|name|string||

### Association
- has_many :items
- has_many :m_categories


## m_categoriesテーブル

|name|string||
|l_category_id|references|foreign_key: true|

### Association
- belongs_to :l_category
- has_many :s_category


## s_categoriesテーブル

|name|string||
|s_category_id|references|foreign_key: true|

### Association
- belongs_to :m_category


## tradesテーブル

|seller_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|status|integer||

### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :item


## trade_commentsテーブル

|content|string||
|user_id|references|foreign_key: true|
|trade_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :trade


## user_reviewsテーブル

|score|integer||
|comment|string||
|user_id|references|foreign_key: true|
|trade_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :trade