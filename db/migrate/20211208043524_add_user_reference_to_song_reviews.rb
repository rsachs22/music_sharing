class AddUserReferenceToSongReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :song_reviews, :users
    add_index :song_reviews, :user_id
    change_column_null :song_reviews, :user_id, false
  end
end
