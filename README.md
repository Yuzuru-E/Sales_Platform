# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby '2.6.5'
  rails '6.0.3.4'
* System dependencies

* Configuration

* Database creation
  
  ## usersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |email|integer|null: false, unique: true|
  |password|string|null: false|
  |contact_mail|text||
  |profile|text||
  |profile_image|text||
  |industry|references|null: false, foreign_key: true|
  |admin|boolean|default: 0|
  ### Association
  - has_many :advertisements, dependent: :destroy
  - has_many :matters, dependent: :destroy 
  - belongs_to :prefecture
  - belongs_to :gender
  - belongs_to :operathing_status
  - belongs_to :evaluation
  - belongs_to :industry

  ## clientsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |company_name|string||
  |postal_code|||
  |prefectures|references|null: false, default: 0|
  |city|text||
  |address|string||
  |building|text||
  |tel|integer||
  |send_order_count|integer||
  |user|references|null: false, foreign_key: true|
  ### Association
  - has_many :matters
  - has_many :advertisements
  - belongs_to :user

  ## contractorsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |operating_status|references|null: false, default: 0|
  |gender|references|null: false, default: 0|
  |age|integer||
  |suggested_price|integer||
  |receive_order_count|integer||
  |user|references|null: false, foreign_key: true|
  ### Association
  - has_many :matters
  - belongs_to :user

  ## advertisementsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user|references|null: false, foreign_key: true|
  |title|string|null: false|
  |content|text|null: false|
  |post_period|string|null:false|
  |banner_img|text|null: false|
  |banner_url|text|null: false|
  |industry|references|null: false, foreign_key: true|
  |cost|integer|null: false|
  ### Association
  - belongs_to :client
  - belongs_to :industry
  
  ## mattersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |client|references|null: false|
  |contractor|references||
  |title|string|null: false|
  |content|string|null: false|
  |post_period|string|null: false|
  |reward|string|null: false|
  |deadline|string||
  |industry|references|null: false, foreign_key: true|
  ### Association
  - belongs_to :client
  - belongs_to :contractor
  - belongs_to :industry

  ## industriesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |ancestry|string|null: false|
  ### Association
  - has_many :advertisements
  - has_many :matters 
  - has_many :users

  ## prefecturesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |prefecture|string|null: false|
  ### Association
  - has_many :users

  ## gendersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |gender|string|null: false|
  ### Association
  - has_many :users

  ## operating_statusテーブル
  |Column|Type|Options|
  |------|----|-------|
  |status|string|null: false|
  ### Association
  - has_many :users

  ## evaluationsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |evaluation|string|null: false|
  ### Association
  - has_many :users

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
