class Post < ApplicationRecord
    has_rich_text :body
    has_many :comments
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :categories_names,
                          -> { select("categories.id, categories.name") }, # Calificar con el nombre de la tabla
                          class_name: "Category",
                          join_table: "categories_posts", # Asegúrate que el nombre de la tabla de unión sea el correcto
                          association_foreign_key: "category_id",
                          foreign_key: "post_id"
    belongs_to :user
    has_one_attached :hero_image do |attachable|
        attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
      end

    accepts_nested_attributes_for :categories

    scope :related, -> { select("posts.id, posts.title, posts.created_at") }
end
