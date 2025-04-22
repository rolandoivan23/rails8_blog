class Post < ApplicationRecord
    has_rich_text :body
    has_many :comments
    has_and_belongs_to_many :categories
    belongs_to :user
    has_one_attached :hero_image
end
