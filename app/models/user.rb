class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :sessions, dependent: :destroy
  has_many :posts
  has_many :posts_titles, -> { select("posts.id, posts.title") }, class_name: "Post"
  has_many :comments
  has_many :followers, foreign_key: :follower_id
  has_many :followers_users, through: :followers, source: :user
  has_many :following_users, foreign_key: :following_user_id
  has_many :following_users_users, through: :following_users, source: :user

  validates_confirmation_of :password
  validates_presence_of :password_confirmation, if: -> { password.present? } # Para asegurar que se envíe si la contraseña se está estableciendo

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
  end
end
