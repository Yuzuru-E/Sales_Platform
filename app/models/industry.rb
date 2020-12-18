class Industry < ApplicationRecord
  has_many :users
  has_many :matters
  has_many :advertisements
  has_ancestry
end
