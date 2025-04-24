class CreateFollowingUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :following_users do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :following_user_id

      t.timestamps
    end
  end
end
