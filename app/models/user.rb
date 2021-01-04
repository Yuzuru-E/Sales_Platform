class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :industry
  has_many :matters, through: :clients
  has_many :contractor
  
  mount_uploader :profile_image, ImageUploader
end