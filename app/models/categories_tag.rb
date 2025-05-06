class CategoriesTag < ApplicationRecord
  belongs_to :tag
  belongs_to :category
end
