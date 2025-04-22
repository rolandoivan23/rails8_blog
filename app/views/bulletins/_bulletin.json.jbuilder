json.extract! bulletin, :id, :title, :body, :created_at, :updated_at
json.url bulletin_url(bulletin, format: :json)
