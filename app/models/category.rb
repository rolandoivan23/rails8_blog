class Category < ApplicationRecord
  has_and_belongs_to_many :posts
  has_one_attached :image
end
