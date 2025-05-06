class Category < ApplicationRecord
  has_and_belongs_to_many :posts
  has_one_attached :image
  has_many :categories_tags
  has_many :tags, through: :categories_tags
end
