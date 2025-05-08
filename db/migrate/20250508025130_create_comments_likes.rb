class CreateCommentsLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :comments_likes do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
