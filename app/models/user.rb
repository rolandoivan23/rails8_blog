class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts
  has_many :followers, foreign_key: :follower_id
  has_many :followers_users, through: :followers, source: :user
  has_many :following_users, foreign_key: :following_user_id
  has_many :following_users_users, through: :following_users, source: :user


  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_one_attached :avatar
end
