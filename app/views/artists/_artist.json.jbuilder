json.extract! artist, :id, :artist_image, :artist_bio, :created_at, :updated_at
json.url artist_url(artist, format: :json)
