class CreateFollowers < ActiveRecord::Migration[8.0]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user, :follower_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
