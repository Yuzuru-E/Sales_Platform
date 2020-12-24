class Contractor < ApplicationRecord
  has_many :matters
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :operating
end
