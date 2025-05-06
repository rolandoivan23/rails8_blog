class Tag < ApplicationRecord
  has_many :categories_tags
  has_many :categories, through: :categories_tags

  validates :name, presence: true, uniqueness: true
end
