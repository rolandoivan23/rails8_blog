class Post < ApplicationRecord
    has_rich_text :body
    has_many :comments
    has_and_belongs_to_many :categories
    belongs_to :user
    has_one_attached :hero_image

    accepts_nested_attributes_for :categories

    acts_as_realtime(self, "#users") do |ws, channel, inst|
        # html = "<div class=" + '"prueba1"' + " > #{inst.title};lkfdjds;lfkds;fdsfdsfdsflfkds;lfkds;lfkds;flkdsf <h1></h1><br/><p><img src=" + '"http://localhost:3000/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MiwicHVyIjoiYmxvYl9pZCJ9fQ==--c25d92f065503d500b75fc697cda97a99c29bb22/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJwbmciLCJyZXNpemVfdG9fbGltaXQiOlsxMDI0LDc2OF19LCJwdXIiOiJ2YXJpYXRpb24ifX0=--f10c11f89a5e9ee7fbe359f1a70cd8150ff8ae03/Ruby_On_Rails_Logo.svg.png"' + "></p></div>"
        html = "<div>Un nuevo usuario con acts as realtime</div>"
        [ Blog, html ] # Este arreglo debe de enviarse de esta manera estrictamente para el buen funcionamiento de la gema.
    end
end
