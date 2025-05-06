class Contact < ApplicationRecord
  validates :name, presence: true
  validates :mail, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true
end
