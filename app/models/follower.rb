class Follower < ApplicationRecord
  belongs_to :user

  validates :follower_id, presence: true
  validates :follower_id, comparison: { other_than: :user_id }
end
