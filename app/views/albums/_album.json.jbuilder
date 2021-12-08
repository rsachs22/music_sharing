json.extract! album, :id, :name, :album_art, :genre_id, :artist_id, :created_at, :updated_at
json.url album_url(album, format: :json)
