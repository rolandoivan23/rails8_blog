class CreateCategoriesTags < ActiveRecord::Migration[8.0]
  def change
    create_table :categories_tags do |t|
      t.references :category, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
