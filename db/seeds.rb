# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create! email_address: 'rolando.vazquez@hey.com', password: '123pum', password_confirmation: '123pum'
User.create! email_address: 'another@hey.com', password: '123pum', password_confirmation: '123pum'

Tag.create! name: 'Popular'
Tag.create! name: 'Recent'
Tag.create! name: 'Trending'

c = Category.create! name: "Ruby on Rails", description: "The first category related to ruby on rails framework"
c.tags << Tag.first


Post.create(title: 'The first post - I really love Ruby on Rails', categories: [ Category.first ])
