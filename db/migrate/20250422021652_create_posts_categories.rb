class CreatePostsCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories_posts, id: false do |t|
      t.references :post, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
