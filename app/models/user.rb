class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts
  has_many :followers
  has_many :following_users


  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_one_attached :avatar
end
