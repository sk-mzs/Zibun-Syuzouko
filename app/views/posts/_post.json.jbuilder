json.extract! post, :id, :title, :body, :area, :picture, :created_at, :updated_at
json.url post_url(post, format: :json)
