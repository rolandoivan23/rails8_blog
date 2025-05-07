class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :sessions, dependent: :destroy
  has_many :posts
  has_many :followers, foreign_key: :follower_id
  has_many :followers_users, through: :followers, source: :user
  has_many :following_users, foreign_key: :following_user_id
  has_many :following_users_users, through: :following_users, source: :user


  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_one_attached :avatar

  acts_as_realtime(self, "#users") do |ws, channel, inst|
      # html = "<div class=" + '"prueba1"' + " > #{inst.title};lkfdjds;lfkds;fdsfdsfdsflfkds;lfkds;lfkds;flkdsf <h1></h1><br/><p><img src=" + '"http://localhost:3000/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MiwicHVyIjoiYmxvYl9pZCJ9fQ==--c25d92f065503d500b75fc697cda97a99c29bb22/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJwbmciLCJyZXNpemVfdG9fbGltaXQiOlsxMDI0LDc2OF19LCJwdXIiOiJ2YXJpYXRpb24ifX0=--f10c11f89a5e9ee7fbe359f1a70cd8150ff8ae03/Ruby_On_Rails_Logo.svg.png"' + "></p></div>"

      # sleep 5
      url = Rails.application.routes.url_helpers.rails_blob_path(inst.avatar, only_path: true)
      html = html = "<div class=\"user-index-page\" > \
      <div class=\"user-list-container\">\
          <ul id=\"users\" class=\"user-list\">\
              <li class=\"user-item\">\
                  <div class=\"user-info-basic\">\
                    <span><img src=\"#{url}\" class=\"comment-avatar\" /></span>\
                      <span>#{inst.email_address}</span>\
                      <p>#{inst.presentation}</p>\
                      </div>\
                  <div class=\"user-buttons\">\
                      <button class=\"follow-btn\" onclick=\"follow_user(#{inst.id})\">\
                          <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" viewBox=\"0 0 16 16\">\
                          <path d=\"M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c0-.001-.001-.048-.064-.208-.303-.631-1.497-1.788-4.936-1.788-3.432 0-4.627 1.148-4.935 1.788-.063.16-.064.207-.064.208z\"></path>\
                          <path d=\"M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z\"></path>\
                          </svg>\
                          Follow\
                      </button>\
                      <div class=\"user-meta\">Joined:ds</div>\
                  </div>\
              </li>\
          </ul>\
      </div>\
  </div>"
      [ Blog, html ] # Este arreglo debe de enviarse de esta manera estrictamente para el buen funcionamiento de la gema.
    end
end
