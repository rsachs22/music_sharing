class AddSongReferenceToSongReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :song_reviews, :songs
    add_index :song_reviews, :song_id
    change_column_null :song_reviews, :song_id, false
  end
end
