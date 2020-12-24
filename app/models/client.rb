class Client < ApplicationRecord
  has_many :matters
  has_many :advertisements
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
