json.extract! song_review, :id, :user_id, :body, :title, :stars, :song_id,
              :created_at, :updated_at
json.url song_review_url(song_review, format: :json)
