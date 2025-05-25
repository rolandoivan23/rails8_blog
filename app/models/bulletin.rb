class Bulletin < ApplicationRecord
  has_one_attached :image

  scope :last_news, -> { select("bulletins.id, bulletins.title, bulletins.created_at, bulletins.source").order(created_at: :desc).limit(3) }
end
