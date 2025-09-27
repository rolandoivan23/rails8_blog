class CreateFollowingUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :following_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :following_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
