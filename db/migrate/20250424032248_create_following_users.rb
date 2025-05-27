class CreateFollowingUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :following_users do |t|
      #t.references :user, null: false, foreign_key: true
      t.references :user, :following_user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
