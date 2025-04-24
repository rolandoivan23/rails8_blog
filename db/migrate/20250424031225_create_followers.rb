class CreateFollowers < ActiveRecord::Migration[8.0]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :follower_id

      t.timestamps
    end
  end
end
