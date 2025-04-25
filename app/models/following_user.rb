class FollowingUser < ApplicationRecord
  belongs_to :user

  validates :following_user_id, presence: true, uniqueness: true

  validates :user_id, comparison: { other_than: :following_user_id }
end
